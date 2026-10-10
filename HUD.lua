local AG=AleeGather
local order={"Herb Gathering","Mining","Fishing","Skinning","Extract Gas"}
local icons={
  ["Herb Gathering"]="Interface\\Icons\\Trade_Herbalism",
  ["Mining"]="Interface\\Icons\\Trade_Mining",
  ["Fishing"]="Interface\\Icons\\Trade_Fishing",
  ["Skinning"]="Interface\\Icons\\INV_Misc_Pelt_Wolf_01",
  ["Extract Gas"]="Interface\\Icons\\Trade_Engineering",
}

local function fmtTime(s)
  s=math.max(0,math.floor(s or 0))
  return string.format("%02d:%02d:%02d",math.floor(s/3600),math.floor((s%3600)/60),s%60)
end

local function makeButton(parent,width,callback)
  return AG:CreateThemedButton(parent,width,22,callback)
end

function AG:SessionElapsed()
  if not self.session.active then return 0 end
  local now=self.session.paused and self.session.pauseAt or GetTime()
  return math.max(0,now-self.session.start-self.session.pausedTotal)
end

function AG:StartSession()
  self.session.start=GetTime()
  self.session.active=true
  self.session.paused=false
  self.session.pauseAt=0
  self.session.pausedTotal=0
  self:RefreshHUD()
end

function AG:ToggleSessionPause()
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

function AG:ResetSession()
  self.session.start=0
  self.session.active=false
  self.session.paused=false
  self.session.pauseAt=0
  self.session.pausedTotal=0
  self.session.total=0
  self.session.last="-"
  for _,cat in ipairs(order) do self.session.counts[cat]=0 end
  self:RefreshHUD()
end

function AG:InitializeHUD()
  local f=CreateFrame("Frame","AleeGatherHUD",UIParent)
  self.hud=f
  f:SetWidth(350)
  f:SetHeight(170)
  f:SetPoint("TOPLEFT",UIParent,"TOPLEFT",self.db.profile.hud.x,self.db.profile.hud.y)
  self:ApplyWindowStyle(f,0.94)
  f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self)
    if not AG.db.profile.hud.locked then self:StartMoving() end
  end)
  f:SetScript("OnDragStop",function(self)
    self:StopMovingOrSizing()
    local l,t=self:GetLeft(),self:GetTop()
    if l and t then
      AG.db.profile.hud.x=l
      AG.db.profile.hud.y=t-UIParent:GetHeight()
    end
  end)

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge")
  f.title:SetPoint("TOPLEFT",22,-18)
  f.title:SetWidth(205)
  f.title:SetJustifyH("LEFT")

  -- The chronometer itself is the session control.
  -- Left click: Start / Pause / Resume. Right click: Reset session.
  f.timeButton=AG:CreateThemedButton(f,112,24)
  f.timeButton:SetPoint("TOPRIGHT",-31,-13)
  f.timeButton:RegisterForClicks("LeftButtonUp","RightButtonUp")
  f.timeButton:SetScript("OnClick",function(_,button)
    if button=="RightButton" then
      AG:ResetSession()
    else
      AG:ToggleSessionPause()
    end
  end)
  f.timeButton:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
    GameTooltip:AddLine(AG:L("TIMER_CONTROL"),1,0.82,0.25)
    GameTooltip:AddLine(AG:L("TIMER_LEFT"),0.92,0.92,0.92)
    GameTooltip:AddLine(AG:L("TIMER_RIGHT"),0.72,0.72,0.72)
    GameTooltip:Show()
  end)
  f.timeButton:SetScript("OnLeave",function() GameTooltip:Hide() end)

  f.prof=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.prof:SetPoint("TOPLEFT",22,-51)
  f.prof:SetWidth(306)
  f.prof:SetJustifyH("LEFT")

  -- The theme engine provides the separator above the profession line.
  f.sep=f:CreateTexture(nil,"ARTWORK")
  f.sep:SetTexture(1,1,1,0)
  f.sep:SetPoint("TOPLEFT",22,-70)
  f.sep:SetPoint("TOPRIGHT",-22,-70)
  f.sep:SetHeight(1)

  f.rows={}
  for _,cat in ipairs(order) do
    local row={}
    row.icon=f:CreateTexture(nil,"ARTWORK")
    row.icon:SetTexture(icons[cat])
    row.icon:SetWidth(18); row.icon:SetHeight(18)

    row.text=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
    row.text:SetWidth(270)
    row.text:SetJustifyH("LEFT")
    row.text:SetPoint("LEFT",row.icon,"RIGHT",8,0)
    f.rows[cat]=row
  end

  f.last=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
  f.last:SetWidth(306)
  f.last:SetJustifyH("LEFT")

  f.radarButton=makeButton(f,112,function()
    AG.db.profile.radar.enabled=not AG.db.profile.radar.enabled
    AG:RefreshAll()
  end)
  f.guideButton=makeButton(f,112,function()
    if AG.ToggleGuide then AG:ToggleGuide() end
  end)

  -- With the timer handling Start/Pause/Resume/Reset, the footer stays clean.
  f.radarButton:SetPoint("BOTTOM",f,"BOTTOM",-59,18)
  f.guideButton:SetPoint("BOTTOM",f,"BOTTOM",59,18)

  local elapsed=0
  f:SetScript("OnUpdate",function(_,dt)
    elapsed=elapsed+dt
    if elapsed>=1 then
      elapsed=0
      AG:RefreshHUD()
    end
  end)

  self:RefreshHUD()
end

function AG:GetProfessionHUDText()
  local parts={}
  for _,cat in ipairs(order) do
    if self:IsProfessionToggleEnabled(cat) then
      local info=self:GetProfessionInfo(cat)
      local key=self.categoryKeys[cat]
      if cat=="Extract Gas" then key="ENGINEERING" end
      local label=self:L(key)
      if info then
        table.insert(parts,label.." "..tostring(info.rank or 0))
      else
        table.insert(parts,label)
      end
    end
  end
  if #parts==0 then return self:L("PROF_NONE") end
  return table.concat(parts,"  •  ")
end

function AG:RefreshHUD()
  local f=self.hud
  if not f or not self.db then return end

  if not self.db.profile.showHUD then
    f:Hide()
    return
  end

  f:Show()
  self:ApplyWindowStyle(f,0.94)

  f.title:SetText("|cff55dd88"..self:L("SESSION").."|r  |cffffcc55"..tostring(self.session.total or 0).."|r")

  if not self.session.active then
    f.timeButton:SetText("|cffb8b8b8"..fmtTime(0).."|r")
  elseif self.session.paused then
    f.timeButton:SetText("|cffffc04d"..fmtTime(self:SessionElapsed()).."|r")
  else
    f.timeButton:SetText("|cffd8f2ff"..fmtTime(self:SessionElapsed()).."|r")
  end

  f.prof:SetText("|cffb8d7ff"..self:L("PROFESSIONS")..":|r "..self:GetProfessionHUDText())

  local visible=0
  for _,cat in ipairs(order) do
    local row=f.rows[cat]
    local show=self:IsProfessionToggleEnabled(cat)
    if show then
      visible=visible+1
      local y=-82-(visible-1)*23
      row.icon:ClearAllPoints()
      row.icon:SetPoint("TOPLEFT",24,y)
      row.icon:Show()
      row.text:Show()
      row.text:SetText(self:L(self.categoryKeys[cat])..": |cffffcc55"..tostring(self.session.counts[cat] or 0).."|r")
    else
      row.icon:Hide()
      row.text:Hide()
    end
  end

  if visible<1 then visible=1 end
  local height=148+(visible*23)
  if height<176 then height=176 end
  if height>270 then height=270 end
  f:SetHeight(height)

  f.last:ClearAllPoints()
  f.last:SetPoint("BOTTOMLEFT",22,48)
  f.last:SetText(self:L("LAST")..": "..(self.session.last or "-"))

  f.radarButton:SetText(self:L("RADAR"))
  f.guideButton:SetText(self:L("GUIDE"))
  self:ApplyThemeDetails(f)
end
