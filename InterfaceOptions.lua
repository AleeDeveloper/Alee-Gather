local AG=AleeGather

function AG:InitializeInterfaceOptions()
  local p=CreateFrame("Frame","AleeGatherInterfaceOptions",UIParent)
  self.interfacePanel=p
  p.name="AleeGather"

  local title=p:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
  title:SetPoint("TOPLEFT",16,-16); title:SetText("AleeGather")
  local sub=p:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
  sub:SetPoint("TOPLEFT",title,"BOTTOMLEFT",0,-8)
  local desc=p:CreateFontString(nil,"ARTWORK","GameFontHighlight")
  desc:SetPoint("TOPLEFT",sub,"BOTTOMLEFT",0,-20); desc:SetWidth(560); desc:SetJustifyH("LEFT")

  local function check(name,key,y,getter,setter)
    local b=CreateFrame("CheckButton",name,p,"UICheckButtonTemplate")
    b:SetPoint("TOPLEFT",18,y); b:SetWidth(24); b:SetHeight(24)
    local txt=p:CreateFontString(nil,"ARTWORK","GameFontNormal")
    txt:SetPoint("LEFT",b,"RIGHT",3,1)
    b._localeKey=key; b._label=txt
    b:SetScript("OnClick",function(self) setter(self:GetChecked()==1); AG:RefreshAll() end)
    b:SetScript("OnShow",function(self) self:SetChecked(getter()); self._label:SetText(AG:L(self._localeKey)) end)
    return b
  end

  check("AleeGatherIOMap","MAP",-100,function() return AG.db.profile.showMap end,function(v) AG.db.profile.showMap=v end)
  check("AleeGatherIOMini","MINIMAP",-130,function() return AG.db.profile.showMinimap end,function(v) AG.db.profile.showMinimap=v end)
  check("AleeGatherIOHUD","HUD",-160,function() return AG.db.profile.showHUD end,function(v) AG.db.profile.showHUD=v end)
  check("AleeGatherIORadar","RADAR",-190,function() return AG.db.profile.radar.enabled end,function(v) AG.db.profile.radar.enabled=v end)
  check("AleeGatherIOButton","BUTTON",-220,function() return AG.db.profile.showButton end,function(v) AG.db.profile.showButton=v end)
  check("AleeGatherIORings","STATUS_RINGS",-250,function() return AG.db.profile.statusRings end,function(v) AG.db.profile.statusRings=v end)
  check("AleeGatherIOSkill","SHOW_ONLY_SKILL",-280,function() return AG.db.profile.showOnlySkill end,function(v) AG.db.profile.showOnlySkill=v end)
  check("AleeGatherIOAutoProf","UNLOCK_PROF_FILTER",-310,function() return AG.db.profile.unlockProfessionFilter end,function(v) AG.db.profile.unlockProfessionFilter=v; AG:InvalidateProfessionCache(); AG:RefreshAll() end)

  local legend=p:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
  legend:SetPoint("TOPLEFT",18,-355)

  local open=CreateFrame("Button",nil,p,"UIPanelButtonTemplate")
  open:SetWidth(210); open:SetHeight(26); open:SetPoint("TOPLEFT",18,-395)
  open:ClearAllPoints(); open:SetPoint("TOPLEFT",18,-395)
  open:SetScript("OnClick",function()
    if InterfaceOptionsFrame and InterfaceOptionsFrame:IsShown() then InterfaceOptionsFrame:Hide() end
    AG:ToggleConfig()
  end)

  local reset=CreateFrame("Button",nil,p,"UIPanelButtonTemplate")
  reset:SetWidth(160); reset:SetHeight(26); reset:SetPoint("LEFT",open,"RIGHT",10,0)
  reset:SetScript("OnClick",function() AG:ResetSession() end)

  p:SetScript("OnShow",function()
    sub:SetText(AG:L("SUBTITLE"))
    desc:SetText(AG:L("IO_DESC"))
    legend:SetText("|cff44ff55●|r "..AG:L("STATE_AVAILABLE").."   |cffff3333●|r "..AG:L("STATE_DEPLETED"))
    open:SetText(AG:L("IO_OPEN_CONFIG"))
    reset:SetText(AG:L("RESET_SESSION"))
  end)

  InterfaceOptions_AddCategory(p)
end
