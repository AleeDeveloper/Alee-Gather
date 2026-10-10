AleeGather=AleeGather or {}
local AG=AleeGather
AG.version="0.98.0-wotlk"; AG.interface=30300
AG.categoryIcons={["Herb Gathering"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernHerb.tga",Mining="Interface\\AddOns\\AleeGather\\Artwork\\ModernMining.tga",Fishing="Interface\\AddOns\\AleeGather\\Artwork\\ModernFishing.tga",["Extract Gas"]="Interface\\AddOns\\AleeGather\\Artwork\\ModernGas.tga",Skinning="Interface\\Icons\\INV_Misc_Pelt_Wolf_01"}
AG.categoryKeys={["Herb Gathering"]="HERBS",Mining="MINES",Fishing="FISH",["Extract Gas"]="GAS",Skinning="SKINNING"}
AG.BackgroundStyles={
  {key="Classic",path="Classic",accent={0.80,0.61,0.29},title={0.95,0.78,0.43},text={0.92,0.88,0.78},muted={0.64,0.61,0.55},header={0.09,0.06,0.03,0.88}},
  {key="Retail",path="Retail",accent={0.25,0.56,0.90},title={0.68,0.82,0.98},text={0.88,0.92,0.98},muted={0.59,0.66,0.76},header={0.025,0.045,0.075,0.92}},
  {key="Forever",path="Forever",accent={0.86,0.49,0.18},title={0.98,0.75,0.40},text={0.92,0.86,0.77},muted={0.67,0.60,0.52},header={0.16,0.075,0.035,0.95}},
  {key="TBC",path="TBC",accent={0.24,0.75,0.48},title={0.60,0.91,0.72},text={0.88,0.95,0.90},muted={0.56,0.69,0.60},header={0.018,0.075,0.048,0.92}},
  {key="Midnight",path="Midnight",accent={0.42,0.36,0.82},title={0.77,0.74,0.96},text={0.91,0.90,0.97},muted={0.62,0.61,0.75},header={0.035,0.025,0.095,0.94}},
  {key="Pandaria",path="Pandaria",accent={0.25,0.67,0.40},title={0.68,0.89,0.72},text={0.89,0.94,0.88},muted={0.58,0.69,0.59},header={0.035,0.090,0.052,0.92}},
}

-- These are the v0.72 border designs the user liked.
-- They remain completely independent from the selected background.
AG.BorderStyles={
  {key="Classic",path="Classic"},
  {key="Retail",path="Retail"},
  {key="Forever",path="Forever"},
  {key="TBC",path="TBC"},
  {key="Midnight",path="Midnight"},
  {key="Pandaria",path="Pandaria"},
}

function AG:GetBackgroundStyle()
  local i=tonumber(self.db and self.db.profile.backgroundTheme) or 2
  if not self.BackgroundStyles[i] then i=2 end
  return self.BackgroundStyles[i],i
end

function AG:GetBorderStyle()
  local i=tonumber(self.db and self.db.profile.borderStyle) or 2
  if not self.BorderStyles[i] then i=2 end
  return self.BorderStyles[i],i
end

-- Kept as an alias for older internal calls.
function AG:GetThemeStyle()
  return self:GetBackgroundStyle()
end

local function SetTextColorSafe(fs,c)
  if fs and fs.SetTextColor and c then
    fs:SetTextColor(c[1],c[2],c[3],1)
  end
end

local function AG_SetBlizzardButtonSliceFiles(button,file)
  if not button then return end
  if button._agBlizzLeft then button._agBlizzLeft:SetTexture(file) end
  if button._agBlizzMiddle then button._agBlizzMiddle:SetTexture(file) end
  if button._agBlizzRight then button._agBlizzRight:SetTexture(file) end
end

function AG:StyleButton(button,theme)
  if not button or not theme then return end

  local txt=theme.text or {0.95,0.92,0.85}

  -- Hide any artwork from the experimental custom-button versions.
  local oldPieces={
    button._agButtonBody,
    button._agButtonInner,
    button._agButtonTop,
    button._agButtonBottom,
    button._agButtonLeft,
    button._agButtonRight,
    button._agButtonShine,
    button._agButtonHover,
  }
  for _,tex in ipairs(oldPieces) do
    if tex and tex.Hide then tex:Hide() end
  end

  -- Clear the incorrect v0.96/v0.97 single stretched atlas texture.
  -- Blizzard's WotLK UIPanelButton is a THREE-PIECE button:
  -- left cap + stretchable middle + right cap.
  if button.SetNormalTexture then button:SetNormalTexture("") end
  if button.SetPushedTexture then button:SetPushedTexture("") end

  if not button._agBlizzLeft then
    button._agBlizzLeft=button:CreateTexture(nil,"ARTWORK")
    button._agBlizzMiddle=button:CreateTexture(nil,"ARTWORK")
    button._agBlizzRight=button:CreateTexture(nil,"ARTWORK")

    -- Exact WotLK UIPanelButtonTemplate atlas slices.
    button._agBlizzLeft:SetTexCoord(0,0.09375,0,0.6875)
    button._agBlizzMiddle:SetTexCoord(0.09375,0.53125,0,0.6875)
    button._agBlizzRight:SetTexCoord(0.53125,0.625,0,0.6875)

    -- Use Blizzard's native highlight atlas with the template's crop.
    button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight","ADD")
  end

  local bh=button:GetHeight() or 22
  if bh<1 then bh=22 end
  -- Blizzard uses 12x22 px side caps. Scale the cap width proportionally
  -- when AleeGather uses 20/24 px-high controls.
  local cap=math.max(8,math.floor((12*bh/22)+0.5))
  local bw=button:GetWidth() or 80
  if cap*2 > bw-8 then cap=math.max(4,math.floor((bw-8)/2)) end

  local left=button._agBlizzLeft
  local middle=button._agBlizzMiddle
  local right=button._agBlizzRight

  left:ClearAllPoints()
  left:SetPoint("LEFT",button,"LEFT",0,0)
  left:SetWidth(cap)
  left:SetHeight(bh)

  right:ClearAllPoints()
  right:SetPoint("RIGHT",button,"RIGHT",0,0)
  right:SetWidth(cap)
  right:SetHeight(bh)

  middle:ClearAllPoints()
  middle:SetPoint("TOPLEFT",left,"TOPRIGHT",0,0)
  middle:SetPoint("BOTTOMRIGHT",right,"BOTTOMLEFT",0,0)

  AG_SetBlizzardButtonSliceFiles(button,"Interface\\Buttons\\UI-Panel-Button-Up")
  left:Show(); middle:Show(); right:Show()

  local h=button:GetHighlightTexture()
  if h then
    h:ClearAllPoints()
    h:SetAllPoints(button)
    h:SetTexCoord(0,0.625,0,0.6875)
    h:SetAlpha(0.90)
  end

  -- Install the Blizzard pressed-state swap once. We swap the same three
  -- slices instead of moving or stretching the frame, so every menu keeps
  -- its original anchors and dimensions.
  if not button._agBlizzPressScripts then
    button:HookScript("OnMouseDown",function(self)
      if self:IsEnabled() then
        AG_SetBlizzardButtonSliceFiles(self,"Interface\\Buttons\\UI-Panel-Button-Down")
      end
    end)
    button:HookScript("OnMouseUp",function(self)
      AG_SetBlizzardButtonSliceFiles(self,"Interface\\Buttons\\UI-Panel-Button-Up")
    end)
    button:HookScript("OnHide",function(self)
      AG_SetBlizzardButtonSliceFiles(self,"Interface\\Buttons\\UI-Panel-Button-Up")
    end)
    button._agBlizzPressScripts=true
  end

  -- AleeGather owns the label. It is centered on the logical Button itself,
  -- never on the atlas artwork and never on Blizzard's pushed-text offset.
  if not button._agLabel then
    local label=button:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
    button._agLabel=label
  end

  local label=button._agLabel
  label:ClearAllPoints()
  label:SetPoint("CENTER",button,"CENTER",0,0)
  label:SetWidth(math.max(1,bw-16))
  label:SetJustifyH("CENTER")
  if label.SetJustifyV then label:SetJustifyV("MIDDLE") end
  if label.SetShadowOffset then label:SetShadowOffset(1,-1) end
  label:SetText(button._agText or "")
  label:Show()
  SetTextColorSafe(label,txt)
end

function AG:CreateThemedButton(parent,width,height,callback)
  -- Raw Button on purpose: UIPanelButtonTemplate in 3.3.5 applies its own
  -- font/pressed offsets and was moving AleeGather labels outside the artwork.
  local b=CreateFrame("Button",nil,parent)
  b:SetWidth(width or 80)
  b:SetHeight(height or 22)
  if parent and parent.GetFrameLevel and b.SetFrameLevel then
    b:SetFrameLevel((parent:GetFrameLevel() or 1)+6)
  end
  b._agText=""

  b.SetText=function(self,text)
    self._agText=tostring(text or "")
    if self._agLabel then self._agLabel:SetText(self._agText) end
  end
  b.GetText=function(self) return self._agText or "" end

  if callback then b:SetScript("OnClick",callback) end
  self:StyleButton(b,self:GetBackgroundStyle())
  return b
end

function AG:EnsureThemePieces(frame)
  if frame._agTheme then return end
  frame._agTheme={}

  local bg=frame:CreateTexture(nil,"BACKGROUND")
  -- Keep the background inset. The decorative frame is fitted around
  -- this region instead of enlarging the background.
  bg:SetPoint("TOPLEFT",frame,"TOPLEFT",6,-6)
  bg:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",-6,6)
  frame._agTheme.bg=bg

  local head=frame:CreateTexture(nil,"BORDER")
  head:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
  head:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
  head:SetHeight(36)
  frame._agTheme.header=head

  local accent=frame:CreateTexture(nil,"ARTWORK")
  accent:SetPoint("TOPLEFT",frame,"TOPLEFT",16,-47)
  accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-16,-47)
  accent:SetHeight(1)
  frame._agTheme.accent=accent

  local tl=frame:CreateTexture(nil,"OVERLAY")
  local tr=frame:CreateTexture(nil,"OVERLAY")
  local bl=frame:CreateTexture(nil,"OVERLAY")
  local br=frame:CreateTexture(nil,"OVERLAY")
  -- Thin frame sits slightly outside the visible background so the
  -- background never peeks past the decorative border.
  for _,t in ipairs({tl,tr,bl,br}) do t:SetWidth(18); t:SetHeight(18) end

  tl:SetPoint("TOPLEFT",bg,"TOPLEFT",-5,5)
  tr:SetPoint("TOPRIGHT",bg,"TOPRIGHT",5,5); tr:SetTexCoord(1,0,0,1)
  bl:SetPoint("BOTTOMLEFT",bg,"BOTTOMLEFT",-5,-5); bl:SetTexCoord(0,1,1,0)
  br:SetPoint("BOTTOMRIGHT",bg,"BOTTOMRIGHT",5,-5); br:SetTexCoord(1,0,1,0)
  frame._agTheme.tl=tl; frame._agTheme.tr=tr; frame._agTheme.bl=bl; frame._agTheme.br=br

  local top=frame:CreateTexture(nil,"OVERLAY")
  local bottom=frame:CreateTexture(nil,"OVERLAY")
  top:SetPoint("TOPLEFT",tl,"TOPRIGHT",-3,-1)
  top:SetPoint("TOPRIGHT",tr,"TOPLEFT",3,-1)
  top:SetHeight(7)
  bottom:SetPoint("BOTTOMLEFT",bl,"BOTTOMRIGHT",-3,1)
  bottom:SetPoint("BOTTOMRIGHT",br,"BOTTOMLEFT",3,1)
  bottom:SetHeight(7); bottom:SetTexCoord(0,1,1,0)
  frame._agTheme.top=top; frame._agTheme.bottom=bottom

  local left=frame:CreateTexture(nil,"OVERLAY")
  local right=frame:CreateTexture(nil,"OVERLAY")
  left:SetPoint("TOPLEFT",tl,"BOTTOMLEFT",1,3)
  left:SetPoint("BOTTOMLEFT",bl,"TOPLEFT",1,-3)
  left:SetWidth(7)
  right:SetPoint("TOPRIGHT",tr,"BOTTOMRIGHT",-1,3)
  right:SetPoint("BOTTOMRIGHT",br,"TOPRIGHT",-1,-3)
  right:SetWidth(7); right:SetTexCoord(1,0,0,1)
  frame._agTheme.left=left; frame._agTheme.right=right
end

function AG:EnsureThemePanel(frame,key,left,top,right,bottom)
  frame._agPanels=frame._agPanels or {}
  local panel=frame._agPanels[key]
  if not panel then
    panel=frame:CreateTexture(nil,"BORDER")
    frame._agPanels[key]=panel
  end
  panel:ClearAllPoints()
  panel:SetPoint("TOPLEFT",frame,"TOPLEFT",left,top)
  panel:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",right,bottom)
  return panel
end

function AG:EnsureSectionStrip(frame,key,label,x,y,w,h)
  frame._agSections=frame._agSections or {}
  local strip=frame._agSections[key]
  if not strip then
    strip=frame:CreateTexture(nil,"ARTWORK")
    frame._agSections[key]=strip
  end
  strip:ClearAllPoints()
  strip:SetPoint("TOPLEFT",frame,"TOPLEFT",x,y)
  strip:SetWidth(w)
  strip:SetHeight(h or 26)
  if label then
    label:ClearAllPoints()
    label:SetPoint("LEFT",strip,"LEFT",12,0)
    label:SetPoint("RIGHT",strip,"RIGHT",-12,0)
    label:SetJustifyH("LEFT")
  end
  return strip
end

function AG:ApplyThemeDetails(frame)
  if not frame then return end
  self:EnsureThemePieces(frame)

  local theme=self:GetBackgroundStyle()
  local border=self:GetBorderStyle()
  if not theme or not border then return end

  local bgBase="Interface\\AddOns\\AleeGather\\Artwork\\UIThemes\\"..theme.path.."\\"
  local borderBase="Interface\\AddOns\\AleeGather\\Artwork\\UIThemes\\"..border.path.."\\"

  -- Frame-specific header/separator layout.
  -- Keeps the accent line away from labels and subtitles.
  frame._agTheme.header:ClearAllPoints()
  frame._agTheme.accent:ClearAllPoints()

  if frame==self.hud then
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
    frame._agTheme.header:SetHeight(29)
    -- Above profession text.
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",20,-41)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-20,-41)

  elseif frame==self.config then
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
    frame._agTheme.header:SetHeight(43)
    -- Below subtitle, above first section.
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",24,-72)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-24,-72)

  elseif frame==self.nodeTooltip then
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",8,-8)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-8,-8)
    frame._agTheme.header:SetHeight(27)
    -- Between node title and details.
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",18,-42)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-18,-42)

  elseif frame==self.guide then
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
    frame._agTheme.header:SetHeight(31)
    -- Above profession line.
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",24,-45)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-24,-45)

  elseif frame==self.radar then
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
    frame._agTheme.header:SetHeight(29)
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",20,-44)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-20,-44)

  else
    frame._agTheme.header:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
    frame._agTheme.header:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-10,-10)
    frame._agTheme.header:SetHeight(36)
    frame._agTheme.accent:SetPoint("TOPLEFT",frame,"TOPLEFT",16,-52)
    frame._agTheme.accent:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-16,-52)
  end
  frame._agTheme.accent:SetHeight(1)

  -- Background / panels / section strips follow Background Theme.
  frame._agTheme.bg:SetTexture(bgBase.."Background.tga")
  frame._agTheme.bg:SetVertexColor(1,1,1,0.99)

  frame._agTheme.header:SetTexture(bgBase.."Header.tga")
  frame._agTheme.header:SetVertexColor(1,1,1,0.96)
  frame._agTheme.accent:SetTexture(theme.accent[1],theme.accent[2],theme.accent[3],0.62)

  -- The decorative frame follows Border Style only.
  local corner=borderBase.."Corner.tga"
  frame._agTheme.tl:SetTexture(corner); frame._agTheme.tr:SetTexture(corner)
  frame._agTheme.bl:SetTexture(corner); frame._agTheme.br:SetTexture(corner)

  local eh=borderBase.."EdgeH.tga"
  frame._agTheme.top:SetTexture(eh); frame._agTheme.bottom:SetTexture(eh)

  local ev=borderBase.."EdgeV.tga"
  frame._agTheme.left:SetTexture(ev); frame._agTheme.right:SetTexture(ev)

  if frame==self.config then
    -- Five aligned cards. They do not touch or overlap each other.
    local pDisplay=self:EnsureThemePanel(frame,"display",24,-88,-364,518)
    local pDatabase=self:EnsureThemePanel(frame,"database",364,-88,-24,640)
    local pProf=self:EnsureThemePanel(frame,"professions",364,-272,-24,374)
    local pLeft=self:EnsureThemePanel(frame,"leftControls",24,-402,-364,66)
    local pRight=self:EnsureThemePanel(frame,"rightControls",364,-532,-24,66)
    for _,pnl in ipairs({pDisplay,pDatabase,pProf,pLeft,pRight}) do
      pnl:SetTexture(bgBase.."Panel.tga")
      pnl:SetVertexColor(1,1,1,0.88)
    end

    -- Header strips are full-width and aligned with each card instead of
    -- floating little boxes around the label text.
    local s1=self:EnsureSectionStrip(frame,"display",frame.sectionDisplay,32,-96,296,27)
    local s2=self:EnsureSectionStrip(frame,"database",frame.sectionDatabase,372,-96,296,27)
    local s3=self:EnsureSectionStrip(frame,"professions",frame.sectionProfessions,372,-280,296,27)
    for _,s in ipairs({s1,s2,s3}) do
      s:SetTexture(bgBase.."Section.tga")
      s:SetVertexColor(1,1,1,0.96)
    end
  end

  if frame==self.hud or frame==self.radar or frame==self.nodeTooltip then
    local body=self:EnsureThemePanel(frame,"body",12,-48,-12,12)
    body:SetTexture(bgBase.."Panel.tga")
    body:SetVertexColor(1,1,1,0.80)
  end

  SetTextColorSafe(frame.title,theme.title)
  SetTextColorSafe(frame.subtitle,theme.muted)
  SetTextColorSafe(frame.prof,theme.text)
  SetTextColorSafe(frame.last,theme.muted)
  SetTextColorSafe(frame.range,theme.text)
  SetTextColorSafe(frame.sectionDisplay,theme.title)
  SetTextColorSafe(frame.sectionDatabase,theme.title)
  SetTextColorSafe(frame.sectionProfessions,theme.title)
  SetTextColorSafe(frame.profNote,theme.muted)
  SetTextColorSafe(frame.staticInfo,theme.text)
  SetTextColorSafe(frame.learnedInfo,theme.text)
  SetTextColorSafe(frame.routeTitle,theme.title)
  SetTextColorSafe(frame.routeCaption,theme.text)
  SetTextColorSafe(frame.nodes,theme.text)
  SetTextColorSafe(frame.zones,theme.text)
  SetTextColorSafe(frame.empty,theme.muted)

  local buttons={
    frame.timeButton,frame.pause,frame.reset,frame.radarButton,frame.guideButton,
    frame.close,frame.lang,frame.profAuto,frame.theme,frame.border,
    frame.zoomOut,frame.zoomIn,frame.sizeDown,frame.sizeUp,
    frame.prevStage,frame.nextStage,frame.prevRoute,frame.nextRoute,
  }
  for _,b in pairs(buttons) do self:StyleButton(b,theme) end
  if frame.routeButtons then
    for _,b in ipairs(frame.routeButtons) do self:StyleButton(b,theme) end
  end
end

function AG:ApplyWindowStyle(frame,alpha)
  if not frame then return end
  -- Remove the old backdrop border/background so it cannot conflict with theme art.
  if frame.SetBackdrop then
    frame:SetBackdrop(nil)
  end
  self:ApplyThemeDetails(frame)
  if frame.SetAlpha and alpha then frame:SetAlpha(alpha) end
end

function AG:RefreshWindowStyles()
  if self.hud then self:ApplyWindowStyle(self.hud,1) end
  if self.radar then self:ApplyWindowStyle(self.radar,self.db.profile.radar.opacity or .72) end
  if self.guide then self:ApplyWindowStyle(self.guide,self.db.profile.guideOpacity or .95) end
  if self.config then self:ApplyWindowStyle(self.config,1) end
  if self.nodeTooltip then self:ApplyWindowStyle(self.nodeTooltip,1) end
end

local defaults={language="auto",showMap=true,showMinimap=true,showHUD=true,showButton=true,mapScale=1,miniScale=1,alpha=.95,mapAlpha=.95,guideOpacity=.95,showOnlySkill=false,hideLowSkill=false,minimapButtonAngle=220,borderStyle=2,backgroundStyle=1,themeStyle=1,backgroundTheme=2,depletedSeconds=300,adaptiveRespawn=true,professionEnabled={},hud={x=20,y=-210,locked=false},radar={enabled=true,x=320,y=20,size=260,range=700,opacity=.72,iconScale=1,iconAlpha=.95,locked=false},debug=false}
local function defaultsCopy(s,d) for k,v in pairs(s) do if type(v)=="table" then if type(d[k])~="table" then d[k]={} end defaultsCopy(v,d[k]) elseif d[k]==nil then d[k]=v end end end
function AG:GetLanguage() if self.db and self.db.profile.language~="auto" then return self.db.profile.language end local l=GetLocale();return l=="esMX" and "esMX" or (l=="esES" and "esES" or "enUS") end
function AG:L(k)local l=self:GetLanguage();local t=AleeGatherLocales and AleeGatherLocales[l];local e=AleeGatherLocales and AleeGatherLocales.enUS;return(t and t[k])or(e and e[k])or k end
function AG:Print(m)DEFAULT_CHAT_FRAME:AddMessage("|cff55dd88AleeGather|r: "..tostring(m))end
AG.event=CreateFrame("Frame");for _,e in ipairs({"ADDON_LOADED","PLAYER_LOGIN","PLAYER_ENTERING_WORLD","SKILL_LINES_CHANGED"})do AG.event:RegisterEvent(e)end
AG.event:SetScript("OnEvent",function(_,event,...)
 if event=="ADDON_LOADED" and (...)=="AleeGather" then AleeGatherDB=AleeGatherDB or {};AleeGatherDB.profile=AleeGatherDB.profile or {};AleeGatherDB.profile.professionEnabled=AleeGatherDB.profile.professionEnabled or {};AleeGatherDB.learned=AleeGatherDB.learned or {};AleeGatherDB.respawnStats=AleeGatherDB.respawnStats or {};defaultsCopy(defaults,AleeGatherDB.profile);if(AleeGatherDB.schemaVersion or 0)<7 then AleeGatherDB.nodes=nil;AleeGatherDB.learned={};AleeGatherDB.schemaVersion=7 end;AG.db=AleeGatherDB;AG.session={start=0,active=false,paused=false,pauseAt=0,pausedTotal=0,total=0,counts={["Herb Gathering"]=0,Mining=0,Fishing=0,["Extract Gas"]=0,Skinning=0},last="-"};AG:InitializeDatabase();AG:InitializeCollector();AG:InitializeDisplay();AG:InitializeHUD();AG:InitializeRadar();AG:InitializeConfig();AG:InitializeInterfaceOptions();AG:Print("v"..AG.version.." - "..AG:L("HELP"))
 elseif event=="PLAYER_LOGIN" or event=="PLAYER_ENTERING_WORLD" or event=="SKILL_LINES_CHANGED" then if AG.InvalidateProfessionCache then AG:InvalidateProfessionCache()end;if AG.RefreshPlayerPositionCache then AG:RefreshPlayerPositionCache()end;if AG.RefreshAll then AG:RefreshAll()end end end)
SLASH_ALEEGATHER1="/ag";SLASH_ALEEGATHER2="/aleegather";SlashCmdList.ALEEGATHER=function(m)m=string.lower(m or "");if m=="guide"or m=="guia"then AG:ToggleGuide()elseif m=="radar"then AG.db.profile.radar.enabled=not AG.db.profile.radar.enabled;AG:RefreshRadar()elseif m=="hud"then AG.db.profile.showHUD=not AG.db.profile.showHUD;AG:RefreshHUD()elseif m=="reset"then AG:ResetSession()elseif m=="db"then AG:PrintDatabaseStats()elseif m=="debug"then AG.db.profile.debug=not AG.db.profile.debug;AG:Print("debug="..tostring(AG.db.profile.debug))else AG:ToggleConfig()end end
