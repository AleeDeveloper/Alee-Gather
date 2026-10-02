AleeGather = AleeGather or {}
local AG = AleeGather
AG.version = "0.40.0-wotlk"
AG.interface = 30300
AG.categoryIcons = {
  ["Herb Gathering"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernHerb.tga",
  ["Mining"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernMining.tga",
  ["Fishing"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernFishing.tga",
  ["Extract Gas"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernGas.tga",
  ["Treasure"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernTreasure.tga",
  ["Skinning"]="Interface\\Icons\\INV_Misc_Pelt_Wolf_01",
}
AG.categoryKeys = {
  ["Herb Gathering"]="HERBS", ["Mining"]="MINES", ["Fishing"]="FISH",
  ["Extract Gas"]="GAS", ["Treasure"]="TREASURE", ["Skinning"]="SKINNING",
}

local defaults = {
  language="auto",
  showMap=true, showMinimap=true, showHUD=true, showButton=true,
  mapScale=1.0, miniScale=1.0, alpha=0.95, mapAlpha=0.95,
  statusRings=true, depletedSeconds=300, depletedMiniAlpha=0.30, adaptiveRespawn=true,
  showOnlySkill=false, unlockProfessionFilter=false,
  categories={["Herb Gathering"]=true,["Mining"]=true,["Fishing"]=true,["Extract Gas"]=true,["Treasure"]=true,["Skinning"]=true},
  minimapButtonAngle=220,
  guideOpacity=0.95,
  hud={x=20,y=-210,locked=false},
  radar={enabled=true,x=320,y=20,size=260,range=700,opacity=0.72,iconScale=1.0,iconAlpha=0.95,locked=false},
  debug=false,
}

local function copyDefaults(src,dst)
  for k,v in pairs(src) do
    if type(v)=="table" then
      if type(dst[k])~="table" then dst[k]={} end
      copyDefaults(v,dst[k])
    elseif dst[k]==nil then dst[k]=v end
  end
end

function AG:GetLanguage()
  if self.db and self.db.profile and self.db.profile.language ~= "auto" then
    return self.db.profile.language
  end
  local loc = GetLocale()
  if loc=="esMX" then return "esMX" end
  if loc=="esES" then return "esES" end
  return "enUS"
end

function AG:L(key)
  local lang=self:GetLanguage()
  local t=AleeGatherLocales and AleeGatherLocales[lang]
  local e=AleeGatherLocales and AleeGatherLocales["enUS"]
  return (t and t[key]) or (e and e[key]) or key
end

function AG:Print(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff55dd88AleeGather|r: "..tostring(msg))
end

AG.event=CreateFrame("Frame")
AG.event:RegisterEvent("ADDON_LOADED")
AG.event:RegisterEvent("PLAYER_LOGIN")
AG.event:RegisterEvent("PLAYER_ENTERING_WORLD")
AG.event:RegisterEvent("SKILL_LINES_CHANGED")
AG.event:SetScript("OnEvent", function(self,event,...)
  if event=="ADDON_LOADED" then
    local addon=...
    if addon=="AleeGather" then
      AleeGatherDB=AleeGatherDB or {}
      AleeGatherDB.profile=AleeGatherDB.profile or {}
      AleeGatherDB.nodes=AleeGatherDB.nodes or {}
      AleeGatherDB.respawnStats=AleeGatherDB.respawnStats or {}
      copyDefaults(defaults,AleeGatherDB.profile)
      AG.db=AleeGatherDB
      AG.session={start=0, active=false, paused=false, pauseAt=0, pausedTotal=0, total=0,
        counts={["Herb Gathering"]=0,Mining=0,Fishing=0,["Extract Gas"]=0,Treasure=0,Skinning=0}, last="-"}
      if AG.InitializeDatabase then AG:InitializeDatabase() end
      if AG.InitializeCollector then AG:InitializeCollector() end
      if AG.InitializeDisplay then AG:InitializeDisplay() end
      if AG.InitializeHUD then AG:InitializeHUD() end
      if AG.InitializeRadar then AG:InitializeRadar() end
      if AG.InitializeConfig then AG:InitializeConfig() end
      if AG.InitializeInterfaceOptions then AG:InitializeInterfaceOptions() end
      AG:Print("v"..AG.version.." - "..AG:L("HELP"))
    end
  elseif event=="PLAYER_LOGIN" or event=="PLAYER_ENTERING_WORLD" or event=="SKILL_LINES_CHANGED" then
    if AG.InvalidateProfessionCache then AG:InvalidateProfessionCache() end
    if AG.RefreshAll then AG:RefreshAll() end
  end
end)

SLASH_ALEEGATHER1="/ag"
SLASH_ALEEGATHER2="/aleegather"
SlashCmdList["ALEEGATHER"]=function(msg)
  msg=string.lower(msg or "")
  if msg=="guide" or msg=="guia" then
    if AG.ToggleGuide then AG:ToggleGuide() end
  elseif msg=="radar" then
    AG.db.profile.radar.enabled=not AG.db.profile.radar.enabled
    AG:RefreshRadar()
  elseif msg=="hud" then
    AG.db.profile.showHUD=not AG.db.profile.showHUD
    AG:RefreshHUD()
  elseif msg=="reset" then
    AG:ResetSession()
  elseif msg=="import" then
    AG:ImportLegacyTables()
  elseif msg=="debug" then
    AG.db.profile.debug=not AG.db.profile.debug
    AG:Print("debug="..tostring(AG.db.profile.debug))
  elseif msg=="help" then
    AG:Print(AG:L("HELP"))
  else
    AG:ToggleConfig()
  end
end
