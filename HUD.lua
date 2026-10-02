local AG=AleeGather
local cats={"Herb Gathering","Mining","Fishing","Extract Gas","Treasure","Skinning"}

local function fmtTime(sec)
  sec=math.max(0,math.floor(sec or 0))
  return string.format("%02d:%02d:%02d",math.floor(sec/3600),math.floor((sec%3600)/60),sec%60)
end

function AG:SessionElapsed()
  if not self.session or not self.session.active then return 0 end
  local now=self.session.paused and self.session.pauseAt or GetTime()
  return math.max(0, now-self.session.start-self.session.pausedTotal)
end

function AG:StartSession()
  if not self.session then return end
  self.session.start=GetTime()
  self.session.active=true
  self.session.paused=false
  self.session.pauseAt=0
  self.session.pausedTotal=0
  self:RefreshHUD()
end

function AG:ResetSession()
  if not self.session then return end
  self.session.start=0
  self.session.active=false
  self.session.paused=false
  self.session.pauseAt=0
  self.session.pausedTotal=0
  self.session.total=0
  self.session.last="-"
  for _,c in ipairs(cats) do self.session.counts[c]=0 end
  self:RefreshHUD()
end

function AG:ToggleSessionPause()
  if not self.session then return end
  if not self.session.active then
    self:StartSession()
    return
  end
  if self.session.paused then
    self.session.pausedTotal=self.session.pausedTotal+(GetTime()-self.session.pauseAt)
    self.session.paused=false
  else
    self.session.paused=true
    self.session.pauseAt=GetTime()
  end
  self:RefreshHUD()
end

local function makeSmallButton(parent,width,label,callback)
  local b=CreateFrame("Button",nil,parent,"UIPanelButtonTemplate")
  b:SetWidth(width); b:SetHeight(20); b:SetText(label or "")
  b:SetScript("OnClick",callback)
  return b
end

function AG:InitializeHUD()
  local f=CreateFrame("Frame","AleeGatherHUD",UIParent)
  self.hud=f
  f:SetWidth(360); f:SetHeight(246)
  f:SetPoint("TOPLEFT",UIParent,"TOPLEFT",self.db.profile.hud.x,self.db.profile.hud.y)
  f:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",
    tile=true,tileSize=32,edgeSize=32,insets={left=11,right=12,top=12,bottom=11}})
  f:SetBackdropColor(0.03,0.05,0.07,0.94)
  f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self) if not AG.db.profile.hud.locked then self:StartMoving() end end)
  f:SetScript("OnDragStop",function(self)
    self:StopMovingOrSizing()
    local l,t=self:GetLeft(),self:GetTop()
    if l and t then AG.db.profile.hud.x=l; AG.db.profile.hud.y=t-UIParent:GetHeight() end
  end)

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge")
  f.title:SetPoint("TOPLEFT",24,-18)
  f.title:SetWidth(170)
  f.title:SetJustifyH("LEFT")
  f.time=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.time:SetWidth(94)
  f.time:SetPoint("TOPRIGHT",-46,-20)
  f.time:SetJustifyH("RIGHT")

  f.prof=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.prof:SetPoint("TOPLEFT",24,-43); f.prof:SetWidth(290); f.prof:SetJustifyH("LEFT")

  local sessionIcons={
    ["Herb Gathering"]="Interface\\Icons\\Trade_Herbalism",
    ["Mining"]="Interface\\Icons\\Trade_Mining",
    ["Fishing"]="Interface\\Icons\\Trade_Fishing",
    ["Extract Gas"]="Interface\\Icons\\Trade_Engineering",
    ["Treasure"]="Interface\\Icons\\INV_Misc_Bag_10",
    ["Skinning"]="Interface\\Icons\\INV_Misc_Pelt_Wolf_01",
  }
  f.lines={}; f.catButtons={}
  for i,c in ipairs(cats) do
    local y=-66-(i-1)*20
    local b=CreateFrame("Button",nil,f)
    b:SetWidth(18); b:SetHeight(18); b:SetPoint("TOPLEFT",24,y+2)
    b.icon=b:CreateTexture(nil,"ARTWORK"); b.icon:SetAllPoints(b); b.icon:SetTexture(sessionIcons[c] or AG.categoryIcons[c])
    b.category=c
    b:SetScript("OnClick",function(self)
      local cat=self.category
      AG.db.profile.categories[cat]=not (AG.db.profile.categories[cat]~=false)
      AG:RefreshAll()
    end)
    b:SetScript("OnEnter",function(self)
      GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
      GameTooltip:AddLine(AG:L(AG.categoryKeys[self.category]),1,1,1)
      if AG.db.profile.categories[self.category]~=false then
        GameTooltip:AddLine(AG:L("CLICK_HIDE_CATEGORY"),0.8,0.8,0.8)
      else
        GameTooltip:AddLine(AG:L("CLICK_SHOW_CATEGORY"),0.8,0.8,0.8)
      end
      if not AG.db.profile.unlockProfessionFilter and not AG:HasProfessionForCategory(self.category) and self.category~="Treasure" then
        GameTooltip:AddLine(AG:L("FILTERED_BY_PROFESSION"),1,0.65,0.2)
      end
      GameTooltip:Show()
    end)
    b:SetScript("OnLeave",function() GameTooltip:Hide() end)
    f.catButtons[c]=b

    local fs=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
    fs:SetPoint("TOPLEFT",49,y); fs:SetJustifyH("LEFT")
    f.lines[c]=fs
  end

  f.last=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
  f.last:SetPoint("TOPLEFT",24,-190); f.last:SetWidth(310); f.last:SetJustifyH("LEFT")

  f.pause=makeSmallButton(f,58,"",function() AG:ToggleSessionPause() end)
  f.pause:SetPoint("BOTTOMLEFT",24,18)
  f.reset=makeSmallButton(f,58,"",function() AG:ResetSession() end)
  f.reset:SetPoint("LEFT",f.pause,"RIGHT",5,0)
  f.radarButton=makeSmallButton(f,58,"",function()
    AG.db.profile.radar.enabled=not AG.db.profile.radar.enabled
    AG:RefreshAll()
  end)
  f.radarButton:SetPoint("LEFT",f.reset,"RIGHT",5,0)
  f.guideButton=makeSmallButton(f,54,"",function() if AG.ToggleGuide then AG:ToggleGuide() end end)
  f.guideButton:SetPoint("LEFT",f.radarButton,"RIGHT",5,0)
  f.guideButton:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_TOP")
    GameTooltip:AddLine(AG:L("GUIDE"),1,1,1)
    GameTooltip:AddLine("/ag guide",0.75,0.85,1)
    GameTooltip:Show()
  end)
  f.guideButton:SetScript("OnLeave",function() GameTooltip:Hide() end)

  -- Settings button (text). More reliable on WotLK than a custom gear texture.
  f.configButton=makeSmallButton(f,64,"",function() if AG.ToggleConfig then AG:ToggleConfig() end end)
  f.configButton:SetPoint("LEFT",f.guideButton,"RIGHT",5,0)
  f.configButton:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_TOP")
    GameTooltip:AddLine(AG:L("CONFIG"),1,1,1)
    GameTooltip:AddLine("/ag",0.75,0.85,1)
    GameTooltip:Show()
  end)
  f.configButton:SetScript("OnLeave",function() GameTooltip:Hide() end)

  local elapsed=0
  f:SetScript("OnUpdate",function(_,e) elapsed=elapsed+e; if elapsed>1 then elapsed=0; AG:RefreshHUD() end end)
  self:RefreshHUD()
end

function AG:GetProfessionHUDText()
  local parts={}
  local order={"Herb Gathering","Mining","Fishing","Skinning","Extract Gas"}
  for _,cat in ipairs(order) do
    local info=self:GetProfessionInfo(cat)
    if info then
      local tex=info.icon and ("|T"..info.icon..":14:14:0:0|t ") or ""
      local profLabelKey=self.categoryKeys[cat]
      if cat=="Extract Gas" then profLabelKey="ENGINEERING" end
      table.insert(parts,tex..self:L(profLabelKey).." "..tostring(info.rank or 0))
    end
  end
  if #parts==0 then return self:L("PROF_NONE") end
  return table.concat(parts,"  ")
end

function AG:RefreshHUD()
  if not self.hud or not self.db then return end
  if self.db.profile.showHUD then self.hud:Show() else self.hud:Hide(); return end
  self.hud.title:SetText("|cff55dd88"..self:L("SESSION").."|r  |cffffcc55"..self.session.total.."|r")
  if not self.session.active then
    self.hud.time:SetText("|cffaaaaaa"..fmtTime(0).."|r")
  elseif self.session.paused then
    self.hud.time:SetText("|cffff5555"..self:L("PAUSED").."|r  "..fmtTime(self:SessionElapsed()))
  else
    self.hud.time:SetText(fmtTime(self:SessionElapsed()))
  end
  self.hud.prof:SetText("|cffb8d7ff"..self:L("PROFESSIONS")..":|r "..self:GetProfessionHUDText())
  for _,c in ipairs(cats) do
    local manuallyOn=self.db.profile.categories[c]~=false
    local profAllowed=self:IsCategoryAllowedByProfession(c)
    local enabled=manuallyOn and profAllowed
    local prefix=enabled and "|cffffffff" or "|cff777777"
    local suffix="|r"
    self.hud.lines[c]:SetText(prefix..self:L(self.categoryKeys[c])..": "..(self.session.counts[c] or 0)..suffix)
    local b=self.hud.catButtons[c]
    if b and b.icon then
      local sessionIcons={
        ["Herb Gathering"]="Interface\\Icons\\Trade_Herbalism",
        ["Mining"]="Interface\\Icons\\Trade_Mining",
        ["Fishing"]="Interface\\Icons\\Trade_Fishing",
        ["Extract Gas"]="Interface\\Icons\\Trade_Engineering",
        ["Treasure"]="Interface\\Icons\\INV_Misc_Bag_10",
    ["Skinning"]="Interface\\Icons\\INV_Misc_Pelt_Wolf_01",
      }
      b.icon:SetTexture(sessionIcons[c] or self.categoryIcons[c])
      b.icon:SetAlpha(enabled and 1.0 or 0.28)
    end
  end
  self.hud.last:SetText(self:L("LAST")..": "..(self.session.last or "-"))
  if not self.session.active then
    self.hud.pause:SetText(self:L("START"))
  elseif self.session.paused then
    self.hud.pause:SetText(self:L("RESUME"))
  else
    self.hud.pause:SetText(self:L("PAUSE"))
  end
  self.hud.reset:SetText(self:L("RESET_SHORT"))
  self.hud.radarButton:SetText((self.db.profile.radar.enabled and "|cff55ff66" or "|cff888888").."Radar|r")
  if self.hud.guideButton then self.hud.guideButton:SetText(self:L("GUIDE")) end
  if self.hud.configButton then self.hud.configButton:SetText(self:L("SETTINGS_SHORT")) end
end
