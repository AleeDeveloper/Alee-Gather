local AG=AleeGather

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
    if not self._setting then callback(v) end
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
  f:SetWidth(700); f:SetHeight(900); f:SetPoint("CENTER")
  f:SetFrameStrata("DIALOG")
  self:ApplyWindowStyle(f,0.97)
  f:Hide(); f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self) self:StartMoving() end)
  f:SetScript("OnDragStop",function(self) self:StopMovingOrSizing() end)

  -- Close with ESC through Blizzard's normal special-frame handling.
  UISpecialFrames=UISpecialFrames or {}
  local configRegistered=false
  for _,name in ipairs(UISpecialFrames) do
    if name=="AleeGatherConfig" then configRegistered=true break end
  end
  if not configRegistered then table.insert(UISpecialFrames,"AleeGatherConfig") end

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge")
  f.title:SetPoint("TOPLEFT",32,-21)
  f.subtitle=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.subtitle:SetPoint("TOPLEFT",32,-47)
  f.subtitle:SetWidth(630); f.subtitle:SetJustifyH("LEFT")

  f.sectionDisplay=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.sectionDisplay:SetPoint("TOPLEFT",36,-96)

  f.checks={}
  f.checks.map=makeCheck(f,"AleeGather67CfgMap",36,-132,"MAP",function(v) AG.db.profile.showMap=v; AG:RefreshAll() end)
  f.checks.mini=makeCheck(f,"AleeGather67CfgMini",36,-162,"MINIMAP",function(v) AG.db.profile.showMinimap=v; AG:RefreshAll() end)
  f.checks.hud=makeCheck(f,"AleeGather67CfgHUD",36,-192,"HUD",function(v) AG.db.profile.showHUD=v; AG:RefreshAll() end)
  f.checks.radar=makeCheck(f,"AleeGather67CfgRadar",36,-222,"RADAR",function(v) AG.db.profile.radar.enabled=v; AG:RefreshAll() end)
  f.checks.button=makeCheck(f,"AleeGather67CfgButton",36,-252,"BUTTON",function(v) AG.db.profile.showButton=v; AG:RefreshAll() end)
  f.checks.skill=makeCheck(f,"AleeGather67CfgSkill",36,-282,"SHOW_ONLY_SKILL",function(v) AG.db.profile.showOnlySkill=v; AG:RefreshAll() end)
  f.checks.lowSkill=makeCheck(f,"AleeGather67CfgLowSkill",36,-312,"HIDE_LOW_SKILL",function(v) AG.db.profile.hideLowSkill=v; AG:RefreshAll() end)
  f.checks.lockRadar=makeCheck(f,"AleeGather67CfgRadarLock",36,-342,"RADAR_LOCK",function(v) AG.db.profile.radar.locked=v end)
  f.checks.adaptive=makeCheck(f,"AleeGather67Adaptive",36,-372,"ADAPTIVE_RESPAWN",function(v) AG.db.profile.adaptiveRespawn=v end)

  f.checks.lowSkill:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
    GameTooltip:AddLine(AG:L("HIDE_LOW_SKILL"),1,0.82,0.25)
    GameTooltip:AddLine(AG:L("HIDE_LOW_SKILL_HELP"),0.9,0.9,0.9,true)

    local cats={"Herb Gathering","Mining","Fishing","Skinning","Extract Gas"}
    local found=false
    for _,cat in ipairs(cats) do
      local info=AG:GetProfessionInfo(cat)
      if info then
        local key=AG.categoryKeys[cat]
        local label=key and AG:L(key) or (info.name or cat)
        GameTooltip:AddDoubleLine(label,tostring(info.rank or 0),0.65,0.84,1,1,1,1)
        found=true
      end
    end
    if not found then
      GameTooltip:AddLine(AG:L("NO_PROF_DETECTED"),1,0.35,0.35,true)
    end
    GameTooltip:Show()
  end)
  f.checks.lowSkill:SetScript("OnLeave",function() GameTooltip:Hide() end)

  f.sectionDatabase=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.sectionDatabase:SetPoint("TOPLEFT",370,-96)

  f.staticInfo=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.staticInfo:SetPoint("TOPLEFT",380,-132)
  f.staticInfo:SetWidth(272); f.staticInfo:SetJustifyH("LEFT")

  f.learnedInfo=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.learnedInfo:SetPoint("TOPLEFT",380,-205)
  f.learnedInfo:SetWidth(272); f.learnedInfo:SetJustifyH("LEFT")

  f.sectionProfessions=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.sectionProfessions:SetPoint("TOPLEFT",370,-282)

  f.profNote=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
  f.profNote:SetPoint("TOPLEFT",380,-316)
  f.profNote:SetWidth(272); f.profNote:SetJustifyH("LEFT")

  f.profChecks={}
  f.profChecks.herb=makeCheck(f,"AleeGather67ProfHerb",380,-354,"HERBS",function(v) AG:SetProfessionToggle("Herb Gathering",v) end)
  f.profChecks.mining=makeCheck(f,"AleeGather67ProfMining",380,-384,"MINES",function(v) AG:SetProfessionToggle("Mining",v) end)
  f.profChecks.fishing=makeCheck(f,"AleeGather67ProfFishing",380,-414,"FISH",function(v) AG:SetProfessionToggle("Fishing",v) end)
  f.profChecks.skinning=makeCheck(f,"AleeGather67ProfSkinning",380,-444,"SKINNING",function(v) AG:SetProfessionToggle("Skinning",v) end)
  f.profChecks.engineering=makeCheck(f,"AleeGather67ProfEngineering",380,-474,"ENGINEERING",function(v) AG:SetProfessionToggle("Extract Gas",v) end)

  f.profAuto=AG:CreateThemedButton(f,210,22);
  f.profAuto:SetPoint("TOPLEFT",380,-506)
  f.profAuto:SetScript("OnClick",function()
    AG:ResetProfessionToggles()
    AG:RefreshConfig()
  end)

  f.mapSlider=makeSlider(f,"AleeGather67MapScale",36,-435,284,0.5,2,0.05,function(v) AG.db.profile.mapScale=v; AG:RefreshWorldMap() end)
  f.mapLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.mapLabel:SetPoint("BOTTOMLEFT",f.mapSlider,"TOPLEFT",0,5)

  f.miniSlider=makeSlider(f,"AleeGather67MiniScale",36,-500,284,0.5,2,0.05,function(v) AG.db.profile.miniScale=v; AG:RefreshMinimap() end)
  f.miniLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.miniLabel:SetPoint("BOTTOMLEFT",f.miniSlider,"TOPLEFT",0,5)

  f.mapOpacity=makeSlider(f,"AleeGather67MapOpacity",36,-565,284,0.2,1,0.05,function(v) AG.db.profile.mapAlpha=v; AG:RefreshWorldMap() end)
  f.mapOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.mapOpacityLabel:SetPoint("BOTTOMLEFT",f.mapOpacity,"TOPLEFT",0,5)

  f.alphaSlider=makeSlider(f,"AleeGather67MiniOpacity",36,-630,284,0.2,1,0.05,function(v) AG.db.profile.alpha=v; AG:RefreshMinimap() end)
  f.alphaLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.alphaLabel:SetPoint("BOTTOMLEFT",f.alphaSlider,"TOPLEFT",0,5)

  f.guideOpacity=makeSlider(f,"AleeGather67GuideOpacity",36,-695,284,0.35,1,0.05,function(v)
    AG.db.profile.guideOpacity=v
    if AG.guide then AG.guide:SetAlpha(v) end
  end)
  f.guideOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.guideOpacityLabel:SetPoint("BOTTOMLEFT",f.guideOpacity,"TOPLEFT",0,5)

  f.radarOpacity=makeSlider(f,"AleeGather67RadarOpacity",36,-760,284,0.25,1,0.05,function(v)
    AG.db.profile.radar.opacity=v; AG:RefreshRadar()
  end)
  f.radarOpacityLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.radarOpacityLabel:SetPoint("BOTTOMLEFT",f.radarOpacity,"TOPLEFT",0,5)

  f.depletedSlider=makeSlider(f,"AleeGather67Depleted",380,-555,270,60,1800,30,function(v)
    AG.db.profile.depletedSeconds=math.floor(v+0.5)
  end)
  f.depletedLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.depletedLabel:SetPoint("BOTTOMLEFT",f.depletedSlider,"TOPLEFT",0,5)

  f.radarRange=makeSlider(f,"AleeGather67RadarRange",380,-620,270,200,2000,50,function(v)
    AG.db.profile.radar.range=math.floor(v+0.5); AG:RefreshRadar()
  end)
  f.radarRangeLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.radarRangeLabel:SetPoint("BOTTOMLEFT",f.radarRange,"TOPLEFT",0,5)

  f.radarSize=makeSlider(f,"AleeGather67RadarSize",380,-685,270,180,420,10,function(v)
    AG.db.profile.radar.size=math.floor(v+0.5); AG:RefreshRadar()
  end)
  f.radarSizeLabel=f:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
  f.radarSizeLabel:SetPoint("BOTTOMLEFT",f.radarSize,"TOPLEFT",0,5)

  f.theme=AG:CreateThemedButton(f,270,24); f.theme:SetPoint("TOPLEFT",380,-724)
  f.theme:SetScript("OnClick",function()
    local _,idx=AG:GetBackgroundStyle()
    AG.db.profile.backgroundTheme=(idx % #AG.BackgroundStyles)+1
    AG:RefreshWindowStyles()
    AG:RefreshConfig()
  end)

  f.border=AG:CreateThemedButton(f,270,24); f.border:SetPoint("TOPLEFT",380,-756)
  f.border:SetScript("OnClick",function()
    local _,idx=AG:GetBorderStyle()
    AG.db.profile.borderStyle=(idx % #AG.BorderStyles)+1
    AG:RefreshWindowStyles()
    AG:RefreshConfig()
  end)

  f.lang=AG:CreateThemedButton(f,270,24); f.lang:SetPoint("TOPLEFT",380,-788)
  f.lang:SetScript("OnClick",function()
    local order={"auto","enUS","esES","esMX"}
    local cur=AG.db.profile.language
    local idx=1
    for i,v in ipairs(order) do if v==cur then idx=i break end end
    AG.db.profile.language=order[(idx%#order)+1]
    AG:RefreshAll()
  end)

  f.pause=AG:CreateThemedButton(f,144,24); f.pause:SetPoint("BOTTOMLEFT",34,20)
  f.pause:SetScript("OnClick",function() AG:ToggleSessionPause(); AG:RefreshHUD() end)

  f.reset=AG:CreateThemedButton(f,144,24); f.reset:SetPoint("LEFT",f.pause,"RIGHT",10,0)
  f.reset:SetScript("OnClick",function() AG:ResetSession() end)

  f.close=AG:CreateThemedButton(f,118,24); f.close:SetPoint("BOTTOMRIGHT",-34,20)
  f.close:SetScript("OnClick",function() f:Hide() end)

  self:RefreshConfig()
  self:ApplyThemeDetails(f)
end

function AG:ToggleConfig()
  if not self.config then self:InitializeConfig() end
  if not self.config then return end
  if self.config:IsShown() then
    self.config:Hide()
  else
    self.config:Show()
    if self.config.Raise then self.config:Raise() end
    self:RefreshConfig()
  end
end

function AG:RefreshConfig()
  local f=self.config
  if not f or not self.db then return end

  self:ApplyWindowStyle(f,0.97)

  f.title:SetText("|cff55dd88"..self:L("TITLE").."|r  |cffaaaaaa"..self.version.."|r")
  f.subtitle:SetText(self:L("SUBTITLE"))
  f.sectionDisplay:SetText(self:L("DISPLAY"))
  f.sectionDatabase:SetText(self:L("DATABASE"))
  f.sectionProfessions:SetText(self:L("PROFESSIONS"))
  f.profNote:SetText(self:L("PROF_TOGGLE_DESC"))

  local values={
    MAP=self.db.profile.showMap,
    MINIMAP=self.db.profile.showMinimap,
    HUD=self.db.profile.showHUD,
    RADAR=self.db.profile.radar.enabled,
    BUTTON=self.db.profile.showButton,
    SHOW_ONLY_SKILL=self.db.profile.showOnlySkill,
    HIDE_LOW_SKILL=self.db.profile.hideLowSkill,
    RADAR_LOCK=self.db.profile.radar.locked,
    ADAPTIVE_RESPAWN=self.db.profile.adaptiveRespawn,
  }
  for _,b in pairs(f.checks) do
    b:SetChecked(values[b.key] and true or false)
    b.text:SetText(self:L(b.key))
  end

  local profMap={
    herb="Herb Gathering", mining="Mining", fishing="Fishing",
    skinning="Skinning", engineering="Extract Gas",
  }
  for key,b in pairs(f.profChecks) do
    b:SetChecked(self:IsProfessionToggleEnabled(profMap[key]))
    b.text:SetText(self:L(b.key))
  end
  f.profAuto:SetText(self:L("PROF_AUTO"))

  local info=AleeGatherStaticInfo or {}
  f.staticInfo:SetText(
    self:L("STATIC_DB").."\n"
    ..self:L("MINES")..": "..tostring(info.mines or 0).."\n"
    ..self:L("HERBS")..": "..tostring(info.herbs or 0).."\n"
    ..self:L("FISH")..": "..tostring(info.fish or 0).."\n"
    ..self:L("STATIC_ZONES")..": "..tostring(info.zones or 0)
  )

  local learned=0
  for _,z in pairs(self.db.learned or {}) do for _ in pairs(z) do learned=learned+1 end end
  f.learnedInfo:SetText(self:L("LEARNED_DB")..": "..learned.."\n"..self:L("LEARNED_NOTE"))

  f.mapLabel:SetText(self:L("SCALE_MAP"))
  f.miniLabel:SetText(self:L("SCALE_MINI"))
  f.mapOpacityLabel:SetText(self:L("MAP_OPACITY")..": "..math.floor((self.db.profile.mapAlpha or .95)*100+.5).."%")
  f.alphaLabel:SetText(self:L("MINIMAP_OPACITY")..": "..math.floor((self.db.profile.alpha or .95)*100+.5).."%")
  f.guideOpacityLabel:SetText(self:L("GUIDE_OPACITY")..": "..math.floor((self.db.profile.guideOpacity or .95)*100+.5).."%")
  f.radarOpacityLabel:SetText(self:L("RADAR_OPACITY")..": "..math.floor((self.db.profile.radar.opacity or .72)*100+.5).."%")
  f.depletedLabel:SetText(self:L("DEPLETED_TIME")..": "..math.floor((self.db.profile.depletedSeconds or 300)/60).." min")
  f.radarRangeLabel:SetText(self:L("RADAR_RANGE")..": "..math.floor(self.db.profile.radar.range or 700).." yd")
  f.radarSizeLabel:SetText(self:L("RADAR_SIZE")..": "..math.floor(self.db.profile.radar.size or 260))

  local sliders={
    {f.mapSlider,self.db.profile.mapScale or 1},
    {f.miniSlider,self.db.profile.miniScale or 1},
    {f.mapOpacity,self.db.profile.mapAlpha or .95},
    {f.alphaSlider,self.db.profile.alpha or .95},
    {f.guideOpacity,self.db.profile.guideOpacity or .95},
    {f.radarOpacity,self.db.profile.radar.opacity or .72},
    {f.depletedSlider,self.db.profile.depletedSeconds or 300},
    {f.radarRange,self.db.profile.radar.range or 700},
    {f.radarSize,self.db.profile.radar.size or 260},
  }
  for _,pair in ipairs(sliders) do
    pair[1]._setting=true; pair[1]:SetValue(pair[2]); pair[1]._setting=nil
  end

  local theme=self:GetBackgroundStyle()
  f.theme:SetText(self:L("BACKGROUND_THEME")..": "..self:L("THEME_"..string.upper(theme.key)))

  local border=self:GetBorderStyle()
  f.border:SetText(self:L("BORDER_STYLE")..": "..self:L("THEME_"..string.upper(border.key)))

  self:ApplyThemeDetails(f)

  local lang=self.db.profile.language
  f.lang:SetText(self:L("LANGUAGE")..": "..(lang=="auto" and self:L("AUTO") or lang))
  f.pause:SetText(self:L("TOGGLE_PAUSE"))
  f.reset:SetText(self:L("RESET_SESSION"))
  f.close:SetText(self:L("CLOSE"))
  self:ApplyThemeDetails(f)
end
