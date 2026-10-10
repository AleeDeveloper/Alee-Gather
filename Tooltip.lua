local AG=AleeGather

local categoryLocale={
  ["Mining"]="MINES",
  ["Herb Gathering"]="HERBS",
  ["Fishing"]="FISH",
  ["Skinning"]="SKINNING",
  ["Extract Gas"]="GAS",
}

function AG:InitializeNodeTooltip()
  if self.nodeTooltip then return self.nodeTooltip end

  local f=CreateFrame("Frame","AleeGatherNodeTooltip",UIParent)
  self.nodeTooltip=f
  f:SetFrameStrata("TOOLTIP")
  if f.SetClampedToScreen then f:SetClampedToScreen(true) end
  f:SetWidth(282)
  f:SetHeight(128)
  self:ApplyWindowStyle(f,1)
  f:Hide()

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.title:SetPoint("TOPLEFT",24,-14)
  f.title:SetPoint("TOPRIGHT",-20,-14)
  f.title:SetJustifyH("LEFT")

  f.category=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.category:SetPoint("TOPLEFT",24,-54)
  f.category:SetPoint("TOPRIGHT",-20,-54)
  f.category:SetJustifyH("LEFT")

  f.skill=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.skill:SetPoint("TOPLEFT",24,-76)
  f.skill:SetPoint("TOPRIGHT",-20,-76)
  f.skill:SetJustifyH("LEFT")

  f.distance=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.distance:SetPoint("TOPLEFT",24,-98)
  f.distance:SetPoint("TOPRIGHT",-20,-98)
  f.distance:SetJustifyH("LEFT")

  return f
end

function AG:PositionNodeTooltip()
  local f=self.nodeTooltip
  if not f or not f:IsShown() then return end

  local scale=UIParent:GetEffectiveScale() or 1
  local cx,cy=GetCursorPosition()
  cx=(cx or 0)/scale
  cy=(cy or 0)/scale

  local pw=UIParent:GetWidth() or 1024
  local ph=UIParent:GetHeight() or 768
  local fw=f:GetWidth() or 270
  local fh=f:GetHeight() or 128
  local pad=12
  local gap=18

  local x
  if cx > pw*0.56 then
    x=cx-fw-gap
  else
    x=cx+gap
  end

  local top=cy+(fh*0.34)

  if x<pad then x=pad end
  if x+fw>pw-pad then x=pw-fw-pad end
  if top>ph-pad then top=ph-pad end
  if top-fh<pad then top=pad+fh end

  f:ClearAllPoints()
  f:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",x,top)
end

function AG:ShowNodeTooltip(owner,rec,distance,anchorMode)
  if not owner or not rec then return end

  local f=self:InitializeNodeTooltip()
  self:ApplyWindowStyle(f,1)

  local cat=self:GetRecordCategory(rec)
  local name=self:GetRecordName(rec) or "Node"
  local skill=self:GetRecordSkill(rec) or 0
  local catKey=categoryLocale[cat]
  local catName=catKey and self:L(catKey) or tostring(cat or "")

  f.title:SetText("|cffffd200"..name.."|r")
  f.category:SetText("|cffaaaaaa"..self:L("CATEGORY")..":|r  "..catName)

  if skill>0 then
    local info=self:GetProfessionInfo(cat)
    local rank=info and tonumber(info.rank) or 0
    local color=(rank>=skill) and "|cff44ff66" or "|cffff5555"
    f.skill:SetText("|cffaaaaaa"..self:L("NODE_LEVEL")..":|r  "..color..skill.."|r")
  else
    f.skill:SetText("|cffaaaaaa"..self:L("NODE_LEVEL")..":|r  |cffcccccc0|r")
  end
  f.skill:Show()

  if distance then
    f.distance:SetText("|cffaaaaaa"..self:L("DISTANCE")..":|r  |cff66ccff"..string.format("%.0f yd",distance).."|r")
    f.distance:Show()
  else
    f.distance:SetText("")
    f.distance:Hide()
  end

  local lines=3+(distance and 1 or 0)
  f:SetHeight(50+lines*20)

  f:Show()
  self:PositionNodeTooltip()

  -- Keep the tooltip tied to the mouse during map/minimap zoom and pan.
  f:SetScript("OnUpdate",function()
    AG:PositionNodeTooltip()
  end)
end

function AG:HideNodeTooltip()
  if self.nodeTooltip then
    self.nodeTooltip:SetScript("OnUpdate",nil)
    self.nodeTooltip:Hide()
  end
end
