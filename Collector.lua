local AG=AleeGather
local gatherSpells={}
local pending=nil
local lastTooltip=nil
local lootWasOpened=false
local lootContext=nil

local function spellName(id) return GetSpellInfo(id) end
local function addSpell(id,cat)
  local n=spellName(id)
  if n then gatherSpells[n]=cat end
end

local function tooltipNode()
  local fs=_G["GameTooltipTextLeft1"]
  local t=fs and fs:GetText()
  if t and AG:GetNodeIDByName(t) then return t end
  return nil
end

local function currentLootItemCount()
  local total=0
  local slots=(GetNumLootItems and GetNumLootItems()) or 0
  for slot=1,slots do
    local _,itemName,quantity=GetLootSlotInfo(slot)
    if itemName then
      local link=GetLootSlotLink and GetLootSlotLink(slot)
      -- Coins have no item link; only count actual items.
      if link then
        quantity=tonumber(quantity) or 1
        if quantity<1 then quantity=1 end
        total=total+quantity
      end
    end
  end
  return total
end

local function ownLootPrefix()
  local fmt=_G.LOOT_ITEM_SELF_MULTIPLE or _G.LOOT_ITEM_SELF
  if not fmt then return nil end
  return string.match(fmt,"^(.-)%%")
end

local function isOwnLootMessage(msg)
  if not msg then return false end
  local prefix=ownLootPrefix()
  if prefix and prefix~="" then
    return string.sub(msg,1,string.len(prefix))==prefix
  end
  -- Fallback for unusual clients/locales.
  return string.find(msg,"|Hitem:",1,true)~=nil
end

local function lootMessageQuantity(msg)
  if not msg then return 1 end
  local qty=string.match(msg,"[xX](%d+)[^%d]*$")
  return tonumber(qty) or 1
end

local function finalizeLootContext()
  if not lootContext then return end
  local amount=tonumber(lootContext.chatTotal) or 0
  if amount<1 then amount=tonumber(lootContext.expected) or 0 end
  if amount<1 then amount=1 end
  AG:RecordSessionGather(lootContext.category,lootContext.name,amount)
  lootContext=nil
end

function AG:InitializeCollector()
  -- IMPORTANT: Smelting (2656) is intentionally NOT registered. Older AleeGather
  -- versions did that and it could create false mining nodes from stale tooltips.
  addSpell(2575,"Mining")
  addSpell(2366,"Herb Gathering")
  addSpell(33095,"Fishing")
  addSpell(30427,"Extract Gas")
  addSpell(8613,"Skinning")
  addSpell(3365,"Treasure")
  addSpell(22810,"Treasure")
  addSpell(1804,"Treasure")

  self.collector=CreateFrame("Frame")
  local f=self.collector
  f:RegisterEvent("UNIT_SPELLCAST_SENT")
  f:RegisterEvent("UNIT_SPELLCAST_FAILED")
  f:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
  f:RegisterEvent("LOOT_OPENED")
  f:RegisterEvent("LOOT_CLOSED")
  f:RegisterEvent("CHAT_MSG_LOOT")
  f:RegisterEvent("UI_ERROR_MESSAGE")
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnUpdate",function(_,elapsed)
    if lootContext and lootContext.finalizeAt and GetTime()>=lootContext.finalizeAt then
      finalizeLootContext()
    end
  end)
  f:SetScript("OnEvent",function(_,event,...)
    if event=="UNIT_SPELLCAST_SENT" then
      local unit,spell,rank,target=...
      if unit~="player" then return end
      local cat=gatherSpells[spell]
      if not cat then return end

      -- Skinning is performed on a creature corpse, not a static world node.
      -- We track its session loot but intentionally do not create map/minimap pins.
      if cat=="Skinning" then
        local zone,x,y=AG:GetPlayerPosition()
        if not zone then return end
        pending={id=nil,name=AG:L("SKINNING"),category=cat,zone=zone,x=x,y=y,started=GetTime(),dynamic=true}
        lootWasOpened=false
        return
      end

      local name=target
      if not name or not AG:GetNodeIDByName(name) then name=tooltipNode() or lastTooltip end
      local id=AG:GetNodeIDByName(name)
      if not id then
        pending=nil
        return
      end
      local n=AG.Nodes[id]
      if not n or n.category~=cat then
        pending=nil
        return
      end
      local zone,x,y=AG:GetPlayerPosition()
      if not zone then return end

      local offset=0
      if cat=="Fishing" then offset=13 elseif cat=="Extract Gas" then offset=8 end
      if offset>0 and AG.ZoneSize[zone] and GetPlayerFacing then
        local facing=GetPlayerFacing()
        if facing then
          local s=AG.ZoneSize[zone]
          x=x+(math.sin(facing)*offset/s[1])
          y=y-(math.cos(facing)*offset/s[2])
        end
      end
      pending={id=id,name=name,category=cat,zone=zone,x=x,y=y,started=GetTime()}
      lootWasOpened=false
      -- If this point already exists, seeing/interacting with the actual world node
      -- means it is currently available.
      AG:MarkNodeAvailable(zone,id,x,y)
    elseif event=="LOOT_OPENED" then
      if not pending then return end
      lootWasOpened=true

      -- GetLootSlotInfo is the best immediate source for stack quantities on 3.3.5a.
      -- CHAT_MSG_LOOT is also collected below as a second source; we use one or the
      -- other, never both, so autoloot clients do not collapse everything to +1.
      if lootContext then finalizeLootContext() end
      lootContext={
        category=pending.category,
        name=pending.name,
        expected=currentLootItemCount(),
        chatTotal=0,
        finalizeAt=nil,
      }

      if pending.category~="Skinning" then
        local added,packed=AG:AddNode(pending.id,pending.zone,pending.x,pending.y,"confirmed-loot")
        pending.packed=packed
        pending.confirmed=true
      else
        pending.confirmed=true
      end

    elseif event=="CHAT_MSG_LOOT" then
      local msg=...
      if lootContext and isOwnLootMessage(msg) then
        lootContext.chatTotal=(lootContext.chatTotal or 0)+lootMessageQuantity(msg)
      end
    elseif event=="LOOT_CLOSED" then
      if pending and lootWasOpened and pending.confirmed and pending.category~="Skinning" then
        AG:MarkNodeDepleted(pending.zone,pending.id,pending.x,pending.y)
      end
      -- Give CHAT_MSG_LOOT a short moment to arrive after autoloot closes the window.
      if lootContext then lootContext.finalizeAt=GetTime()+0.40 end
      pending=nil
      lootWasOpened=false
    elseif event=="UNIT_SPELLCAST_FAILED" or event=="UNIT_SPELLCAST_INTERRUPTED" then
      local unit=...
      if unit=="player" then
        pending=nil
        lootWasOpened=false
      end
    elseif event=="UI_ERROR_MESSAGE" then
      -- Do not create a DB point from an error. We only use the tooltip to
      -- recognize a real visible node and mark an existing point available.
      local t=tooltipNode()
      local id=AG:GetNodeIDByName(t)
      if id then
        local zone,x,y=AG:GetPlayerPosition()
        if zone then AG:MarkNodeAvailable(zone,id,x,y) end
      end
    elseif event=="PLAYER_ENTERING_WORLD" then
      pending=nil
      lootWasOpened=false
      lootContext=nil
    end
  end)

  if GameTooltip and GameTooltip.HookScript then
    GameTooltip:HookScript("OnShow",function()
      local t=tooltipNode()
      if t then
        lastTooltip=t
        local id=AG:GetNodeIDByName(t)
        local zone,x,y=AG:GetPlayerPosition()
        if id and zone then AG:MarkNodeAvailable(zone,id,x,y) end
      end
    end)
  end
end
