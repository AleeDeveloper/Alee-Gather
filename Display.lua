local AG=AleeGather
local mpool,map,ipool,mini={},{},{},{}

local function isExternallyManagedMinimapButton(button)
  if not button or not Minimap then return false end
  local parent=button:GetParent()
  return parent and parent~=Minimap
end
local function release(a,p)for i=#a,1,-1 do local f=a[i];f:Hide();f:ClearAllPoints();f.rec=nil;f.distance=nil;f.tooltipMode=nil;table.insert(p,f);a[i]=nil end end
local function acquire(p,parent,size,mouse)
  local f=table.remove(p)
  if not f then
    f=CreateFrame("Frame",nil,parent)
    f.icon=f:CreateTexture(nil,"OVERLAY")
    f.icon:SetAllPoints(f)
    f:EnableMouse(mouse and true or false)
    f:SetScript("OnEnter",function(self)
      if self.rec then AG:ShowNodeTooltip(self,self.rec,self.distance,self.tooltipMode) end
    end)
    f:SetScript("OnLeave",function() AG:HideNodeTooltip() end)
  end
  f:SetParent(parent)
  f:SetWidth(size); f:SetHeight(size)
  f:EnableMouse(mouse and true or false)
  if parent.GetFrameLevel then f:SetFrameLevel((parent:GetFrameLevel()or 1)+5) end
  f:Show()
  return f
end

function AG:InitializeDisplay()self.display=CreateFrame("Frame");self.display:RegisterEvent("WORLD_MAP_UPDATE");self.display:SetScript("OnEvent",function()AG:RefreshWorldMap()end);local t=0;self.display:SetScript("OnUpdate",function(_,d)t=t+d;if t>.2 then t=0;if not(WorldMapFrame and WorldMapFrame:IsShown())then AG:RefreshPlayerPositionCache();AG:RefreshMinimap()end end end);if WorldMapFrame and WorldMapFrame.HookScript then WorldMapFrame:HookScript("OnShow",function()release(mini,ipool);AG:RefreshWorldMap()end);WorldMapFrame:HookScript("OnHide",function()release(map,mpool);if not AG._mapAfter then AG._mapAfter=CreateFrame("Frame")end;AG._mapAfter:Show();AG._mapAfter:SetScript("OnUpdate",function(self)self:SetScript("OnUpdate",nil);self:Hide();AG:RefreshPlayerPositionCache();AG:RefreshMinimap()end)end)end;self:CreateMinimapButton()end
function AG:RefreshWorldMap()release(map,mpool);if not self.db.profile.showMap or not WorldMapFrame:IsShown()then return end;local r=self:GetWorldMapRecords();local w,h=WorldMapButton:GetWidth(),WorldMapButton:GetHeight();if not w or w<=0 then return end;local size=16*(self.db.profile.mapScale or 1);for i=1,#r do local n=r[i];local c=self:GetRecordCategory(n);if c and self:IsCategoryEnabled(c)and self:PassesSkillFilterRecord(n)then local x,y=self:GetRecordXY(n);if x>=0 and x<=1 and y>=0 and y<=1 then local f=acquire(mpool,WorldMapButton,size,true);f.rec=n;f.distance=nil;f.tooltipMode="auto";f.icon:SetTexture(self:GetRecordIcon(n)or self.categoryIcons[c]);f.icon:SetAlpha(self.db.profile.mapAlpha or .95);f:SetPoint("CENTER",WorldMapButton,"TOPLEFT",x*w,-y*h);map[#map+1]=f end end end end
local function rot(x,y,a)local c,s=math.cos(a),math.sin(a);return x*c-y*s,x*s+y*c end
function AG:RefreshMinimap()if WorldMapFrame and WorldMapFrame:IsShown()then release(mini,ipool);return end;release(mini,ipool);if not self.db.profile.showMinimap or not Minimap:IsShown()then return end;local z,px,py=self:GetPlayerPosition();local zs=z and self.ZoneSize[z];if not zs then return end;local zoom=Minimap:GetZoom()or 0;local rad=(self.MinimapDiameterYards.outdoor[zoom]or 200)/2;local mw,mh=Minimap:GetWidth()/2,Minimap:GetHeight()/2;local rotate=GetCVar("rotateMinimap")=="1";local face=(GetPlayerFacing and GetPlayerFacing())or 0;local size=15*(self.db.profile.miniScale or 1);self:ForEachNearbyNode(z,px,py,rad*1.12,function(n)local c=self:GetRecordCategory(n);if not c or not self:IsCategoryEnabled(c)or not self:PassesSkillFilterRecord(n)then return end;local x,y=self:GetRecordXY(n);local dx=(x-px)*zs[1];local dy=(y-py)*zs[2];if rotate then dx,dy=rot(dx,dy,-face)end;local d=math.sqrt(dx*dx+dy*dy);if d>rad*1.05 then return end;local ox=dx/rad*mw;local oy=-dy/rad*mh;local rr=math.sqrt((ox/mw)^2+(oy/mh)^2);if rr>.94 then ox=ox*.94/rr;oy=oy*.94/rr end;local f=acquire(ipool,Minimap,size,true);f.rec=n;f.distance=d;f.tooltipMode="cursor-left";f.icon:SetTexture(self:GetRecordIcon(n)or self.categoryIcons[c]);f.icon:SetAlpha(self:GetNodeState(n)=="depleted"and .32 or(self.db.profile.alpha or .95));f:SetPoint("CENTER",Minimap,"CENTER",ox,oy);mini[#mini+1]=f end)end
function AG:CreateMinimapButton()
  local b=CreateFrame("Button","AleeGatherMinimapButton",Minimap)
  self.minimapButton=b

  b:SetWidth(32); b:SetHeight(32)
  b:SetFrameStrata("MEDIUM")

  -- Restore the original GatherMate-style gathering icon used by the stable build.
  b:SetNormalTexture("Interface\\AddOns\\AleeGather\\Artwork\\GatherMateIcon.tga")
  b:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

  b:RegisterForClicks("LeftButtonUp","RightButtonUp")
  b:RegisterForDrag("LeftButton")

  b:SetScript("OnClick",function(_,button)
    if button=="RightButton" then
      AG.db.profile.radar.enabled=not AG.db.profile.radar.enabled
      AG:RefreshRadar()
    else
      AG:ToggleConfig()
    end
  end)

  b:SetScript("OnDragStart",function(self)
    -- Minimap button bags/collectors reparent addon buttons into their own
    -- container. Never fight their positioning system.
    if isExternallyManagedMinimapButton(self) then return end
    self.dragging=true
    self:SetScript("OnUpdate",function() AG:UpdateMinimapButtonFromCursor() end)
  end)

  b:SetScript("OnDragStop",function(self)
    self.dragging=false
    self:SetScript("OnUpdate",nil)
  end)

  b:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_LEFT")
    GameTooltip:AddLine("AleeGather",0.3,1,0.55)
    GameTooltip:AddLine(AG:L("MINIMAP_BUTTON_DESC"),0.85,0.85,0.85,true)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine(AG:L("LEFT_CONFIG"),1,1,1)
    GameTooltip:AddLine(AG:L("RIGHT_RADAR"),0.8,0.8,0.8)
    GameTooltip:Show()
  end)
  b:SetScript("OnLeave",function() GameTooltip:Hide() end)

  self:PositionMinimapButton()
end

function AG:PositionMinimapButton()
  if not self.minimapButton or not self.db then return end

  -- DragonflightUI, MBB-style collectors and similar addons commonly
  -- reparent minimap buttons. Once externally managed, AleeGather must stop
  -- clearing points/repositioning it or the button can escape the menu.
  if isExternallyManagedMinimapButton(self.minimapButton) then
    if self.db.profile.showButton then
      self.minimapButton:Show()
    else
      self.minimapButton:Hide()
    end
    return
  end

  local a=math.rad(self.db.profile.minimapButtonAngle or 220)
  local r=82

  self.minimapButton:ClearAllPoints()
  self.minimapButton:SetPoint("CENTER",Minimap,"CENTER",math.cos(a)*r,math.sin(a)*r)

  if self.db.profile.showButton then
    self.minimapButton:Show()
  else
    self.minimapButton:Hide()
  end
end

function AG:UpdateMinimapButtonFromCursor()
  if not self.minimapButton or isExternallyManagedMinimapButton(self.minimapButton) then return end

  local mx,my=Minimap:GetCenter()
  local scale=Minimap:GetEffectiveScale()
  local cx,cy=GetCursorPosition()

  cx=cx/scale
  cy=cy/scale

  self.db.profile.minimapButtonAngle=math.deg(math.atan2(cy-my,cx-mx))
  self:PositionMinimapButton()
end

function AG:RefreshAll()self:PositionMinimapButton();self:RefreshWorldMap();self:RefreshMinimap();if self.RefreshHUD then self:RefreshHUD()end;if self.RefreshRadar then self:RefreshRadar()end;if self.RefreshConfig then self:RefreshConfig()end end
