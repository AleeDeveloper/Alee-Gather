local AG=AleeGather
local cats={"Herb Gathering","Mining","Fishing","Extract Gas","Treasure","Skinning"}

local function makeCheck(parent,name,x,y,key,callback)
  local b=CreateFrame("CheckButton",name,parent,"UICheckButtonTemplate")
  b:SetPoint("TOPLEFT",x,y); b:SetWidth(24); b:SetHeight(24)
  b.text=parent:CreateFontString(nil,"OVERLAY","GameFontNormal")
  b.text:SetPoint("LEFT",b,"RIGHT",2,1)
  b:SetScript("OnClick",function(self) callback(self:GetChecked()==1) end)
  b.key=key
  return b
end

local function makeSlider(parent,name,x,y,w,minv,maxv,step,callback)
  local s=CreateFrame("Slider",name,parent,"OptionsSliderTemplate")
  s:SetPoint("TOPLEFT",x,y); s:SetWidth(w); s:SetHeight(16)
  s:SetMinMaxValues(minv,maxv); s:SetValueStep(step)
  s:SetScript("OnValueChanged",function(self,v)
    if self._setting then return end
    callback(v)
  end)
  local low=_G[name.."Low"]; local high=_G[name.."High"]; local text=_G[name.."Text"]
  if low then low:SetText(tostring(minv)) end
  if high then high:SetText(tostring(maxv)) end
  if text then text:SetText("") end
  return s
end

function AG:InitializeConfig()
  local f=CreateFrame("Frame","AleeGatherConfig",UIParent)
  self.config=f
  f:SetWidth(640); f:SetHeight(750); f:SetPoint("CENTER")
  f:SetFrameStrata("DIALOG")
  f:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",tile=true,tileSize=32,edgeSize=32,insets={left=11,right=12,top=12,bottom=11}})
  f:Hide(); f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self) self:StartMoving() end)
  f:SetScript("OnDragStop",function(self) self:StopMovingOrSizing() end)

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge"); f.title:SetPoint("TOPLEFT",24,-22)
  f.subtitle=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall"); f.subtitle:SetPoint("TOPLEFT",24,-45)

  f.sectionDisplay=f:CreateFontString(nil,"OVERLAY","GameFontNormal"); f.sectionDisplay:SetPoint("TOPLEFT",24,-72)
  f.checks={}
  f.checks.map=makeCheck(f,"AleeGatherCfgMap",24,-92,"MAP",function(v) AG.db.profile.showMap=v; AG:RefreshAll() end)
  f.checks.mini=makeCheck(f,"AleeGatherCfgMini",24,-122,"MINIMAP",function(v) AG.db.profile.showMinimap=v; AG:RefreshAll() end)
  f.checks.hud=makeCheck(f,"AleeGatherCfgHUD",24,-152,"HUD",function(v) AG.db.profile.showHUD=v; AG:RefreshAll() end)
  f.checks.radar=makeCheck(f,"AleeGatherCfgRadar",24,-182,"RADAR",function(v) AG.db.profile.radar.enabled=v; AG:RefreshAll() end)
  f.checks.button=makeCheck(f,"AleeGatherCfgButton",24,-212,"BUTTON",function(v) AG.db.profile.showButton=v; AG:RefreshAll() end)
  f.checks.rings=makeCheck(f,"AleeGatherCfgRings",24,-242,"STATUS_RINGS",function(v) AG.db.profile.statusRings=v; AG:RefreshAll() end)
  f.checks.skill=makeCheck(f,"AleeGatherCfgSkill",24,-272,"SHOW_ONLY_SKILL",function(v) AG.db.profile.showOnlySkill=v; AG:RefreshAll() end)
  f.checks.unlockProf=makeCheck(f,"AleeGatherCfgUnlockProf",24,-302,"UNLOCK_PROF_FILTER",function(v) AG.db.profile.unlockProfessionFilter=v; AG:InvalidateProfessionCache(); AG:RefreshAll() end)

  f.catTitle=f:CreateFontString(nil,"OVERLAY","GameFontNormal"); f.catTitle:SetPoint("TOPLEFT",340,-72)
  f.catChecks={}
  for i,c in ipairs(cats) do
    local b=makeCheck(f,"AleeGatherCat"..i,340,-92-(i-1)*30,AG.categoryKeys[c],function(v) AG.db.profile.categories[c]=v; AG:RefreshAll() end)
    b.category=c; f.catChecks[c]=b
  end

  f.adaptiveRespawn=makeCheck(f,"AleeGatherAdaptiveRespawn",340,-272,"ADAPTIVE_RESPAWN",function(v) AG.db.profile.adaptiveRespawn=v end)
  f.lockRadar=makeCheck(f,"AleeGatherRadarLock",340,-302,"RADAR_LOCK",function(v) AG.db.profile.radar.locked=v end)

  -- Sizes
  f.mapSlider=makeSlider(f,"AleeGatherMapScale",35,-365,250,0.5,2,0.05,function(v) AG.db.profile.mapScale=v; AG:RefreshWorldMap() end)
  f.mapLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.mapLabel:SetPoint("BOTTOMLEFT",f.mapSlider,"TOPLEFT",0,5)
  f.miniSlider=makeSlider(f,"AleeGatherMiniScale",345,-365,250,0.5,2,0.05,function(v) AG.db.profile.miniScale=v; AG:RefreshMinimap() end)
  f.miniLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.miniLabel:SetPoint("BOTTOMLEFT",f.miniSlider,"TOPLEFT",0,5)

  -- Map / minimap opacity
  f.mapOpacity=makeSlider(f,"AleeGatherMapOpacity",35,-430,250,0.2,1,0.05,function(v) AG.db.profile.mapAlpha=v; AG:RefreshWorldMap() end)
  f.mapOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.mapOpacityLabel:SetPoint("BOTTOMLEFT",f.mapOpacity,"TOPLEFT",0,5)
  f.alphaSlider=makeSlider(f,"AleeGatherAlpha",345,-430,250,0.2,1,0.05,function(v) AG.db.profile.alpha=v; AG:RefreshMinimap() end)
  f.alphaLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.alphaLabel:SetPoint("BOTTOMLEFT",f.alphaSlider,"TOPLEFT",0,5)

  -- Guide opacity / estimated respawn
  f.guideOpacity=makeSlider(f,"AleeGatherGuideOpacityCfg",35,-495,250,0.35,1,0.05,function(v)
    AG.db.profile.guideOpacity=v
    if AG.guide then AG.guide:SetAlpha(v) end
  end)
  f.guideOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.guideOpacityLabel:SetPoint("BOTTOMLEFT",f.guideOpacity,"TOPLEFT",0,5)

  f.depletedSlider=makeSlider(f,"AleeGatherDepleted",345,-495,250,60,1800,30,function(v) AG.db.profile.depletedSeconds=math.floor(v+0.5); AG:RefreshAll() end)
  f.depletedLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.depletedLabel:SetPoint("BOTTOMLEFT",f.depletedSlider,"TOPLEFT",0,5)

  -- Radar
  f.radarRange=makeSlider(f,"AleeGatherRadarRange",35,-560,250,200,2000,50,function(v) AG.db.profile.radar.range=math.floor(v+0.5); AG:RefreshRadar() end)
  f.radarRangeLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.radarRangeLabel:SetPoint("BOTTOMLEFT",f.radarRange,"TOPLEFT",0,5)
  f.radarSize=makeSlider(f,"AleeGatherRadarSize",345,-560,250,180,420,10,function(v) AG.db.profile.radar.size=math.floor(v+0.5); AG:RefreshRadar() end)
  f.radarSizeLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.radarSizeLabel:SetPoint("BOTTOMLEFT",f.radarSize,"TOPLEFT",0,5)

  f.radarOpacity=makeSlider(f,"AleeGatherRadarOpacity",35,-625,250,0.25,1,0.05,function(v) AG.db.profile.radar.opacity=v; AG:RefreshRadar() end)
  f.radarOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); f.radarOpacityLabel:SetPoint("BOTTOMLEFT",f.radarOpacity,"TOPLEFT",0,5)

  -- Bottom button grid: two rows of three equal 188px buttons, 14px gaps,
  -- aligned to the panel's 24px side margins (24+188+14+188+14+188 = 616).
  f.lang=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.lang:SetSize(188,24); f.lang:SetPoint("BOTTOMLEFT",24,66)
  f.lang:SetScript("OnClick",function()
    local order={"auto","enUS","esES","esMX","zhCN"}; local cur=AG.db.profile.language; local idx=1
    for i,v in ipairs(order) do if v==cur then idx=i break end end
    AG.db.profile.language=order[(idx%#order)+1]
    AG:RefreshAll()
  end)

  f.pause=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.pause:SetSize(188,24); f.pause:SetPoint("BOTTOMLEFT",226,66)
  f.pause:SetScript("OnClick",function() AG:ToggleSessionPause(); AG:RefreshHUD() end)
  f.reset=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.reset:SetSize(188,24); f.reset:SetPoint("BOTTOMLEFT",428,66)
  f.reset:SetScript("OnClick",function() AG:ResetSession() end)
  f.clearImported=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.clearImported:SetSize(188,24); f.clearImported:SetPoint("BOTTOMLEFT",24,38)
  f.clearImported:SetScript("OnClick",function()
    local n=AG:ClearImportedNodes()
    AG:Print(string.format(AG:L("CLEAR_IMPORTED_DONE"),n))
  end)
  f.clearDB=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.clearDB:SetSize(188,24); f.clearDB:SetPoint("BOTTOMLEFT",226,38)
  f.clearDB:SetScript("OnClick",function() if AG.ConfirmClearAll then AG.ConfirmClearAll() end end)
  f.close=CreateFrame("Button",nil,f,"UIPanelButtonTemplate"); f.close:SetSize(188,24); f.close:SetPoint("BOTTOMLEFT",428,38)
  f.close:SetScript("OnClick",function() f:Hide() end)

  f.legend=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.legend:SetPoint("BOTTOMLEFT",24,96); f.legend:SetWidth(580); f.legend:SetJustifyH("LEFT")
  f.note=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall"); f.note:SetPoint("BOTTOMLEFT",24,10); f.note:SetWidth(592); f.note:SetJustifyH("LEFT")
  self:RefreshConfig()
end

function AG:ToggleConfig()
  if not self.config then return end
  if self.config:IsShown() then self.config:Hide() else self:RefreshConfig(); self.config:Show() end
end

function AG:RefreshConfig()
  local f=self.config
  if not f or not self.db then return end
  f.title:SetText("|cff55dd88"..self:L("TITLE").."|r  |cffaaaaaa"..self.version.."|r")
  f.subtitle:SetText(self:L("SUBTITLE"))
  f.sectionDisplay:SetText(self:L("DISPLAY"))
  f.catTitle:SetText(self:L("FILTERS"))
  local vals={
    map=self.db.profile.showMap,mini=self.db.profile.showMinimap,hud=self.db.profile.showHUD,
    radar=self.db.profile.radar.enabled,button=self.db.profile.showButton,
    rings=self.db.profile.statusRings,skill=self.db.profile.showOnlySkill,unlockProf=self.db.profile.unlockProfessionFilter
  }
  for k,b in pairs(f.checks) do b:SetChecked(vals[k]); b.text:SetText(self:L(b.key)) end
  for c,b in pairs(f.catChecks) do b:SetChecked(self.db.profile.categories[c]); b.text:SetText(self:L(b.key)) end
  f.adaptiveRespawn:SetChecked(self.db.profile.adaptiveRespawn); f.adaptiveRespawn.text:SetText(self:L("ADAPTIVE_RESPAWN"))
  f.lockRadar:SetChecked(self.db.profile.radar.locked); f.lockRadar.text:SetText(self:L("RADAR_LOCK"))
  f.mapLabel:SetText(self:L("SCALE_MAP")); f.miniLabel:SetText(self:L("SCALE_MINI"))
  f.mapOpacityLabel:SetText(self:L("MAP_OPACITY")..": "..math.floor((self.db.profile.mapAlpha or 0.95)*100+0.5).."%")
  f.alphaLabel:SetText(self:L("MINIMAP_OPACITY")..": "..math.floor((self.db.profile.alpha or 0.95)*100+0.5).."%")
  f.guideOpacityLabel:SetText(self:L("GUIDE_OPACITY")..": "..math.floor((self.db.profile.guideOpacity or 0.95)*100+0.5).."%")
  f.depletedLabel:SetText(self:L("DEPLETED_TIME")..": "..math.floor(self.db.profile.depletedSeconds/60).." min")
  f.radarRangeLabel:SetText(self:L("RADAR_RANGE")..": "..math.floor(self.db.profile.radar.range).." yd")
  f.radarSizeLabel:SetText(self:L("RADAR_SIZE")..": "..math.floor(self.db.profile.radar.size))
  f.radarOpacityLabel:SetText(self:L("RADAR_OPACITY")..": "..math.floor((self.db.profile.radar.opacity or 0.72)*100+0.5).."%")
  local values={
    {f.mapSlider,self.db.profile.mapScale},{f.miniSlider,self.db.profile.miniScale},
    {f.mapOpacity,self.db.profile.mapAlpha or 0.95},{f.alphaSlider,self.db.profile.alpha},
    {f.guideOpacity,self.db.profile.guideOpacity or 0.95},{f.depletedSlider,self.db.profile.depletedSeconds},
    {f.radarRange,self.db.profile.radar.range},{f.radarSize,self.db.profile.radar.size},
    {f.radarOpacity,self.db.profile.radar.opacity}
  }
  for _,pair in ipairs(values) do pair[1]._setting=true; pair[1]:SetValue(pair[2]); pair[1]._setting=nil end
  local lang=self.db.profile.language
  f.lang:SetText(self:L("LANGUAGE")..": "..(lang=="auto" and self:L("AUTO") or lang))
  f.pause:SetText(self:L("TOGGLE_PAUSE")); f.reset:SetText(self:L("RESET_SESSION")); f.close:SetText(self:L("CLOSE"))
  f.clearImported:SetText(self:L("CLEAR_IMPORTED")); f.clearDB:SetText(self:L("RESET_DB"))
  f.legend:SetText("|cff44ff55●|r "..self:L("STATE_AVAILABLE").."    |cffff3333●|r "..self:L("STATE_DEPLETED"))
  f.note:SetText(self:L("SEED_NOTE"))
end
