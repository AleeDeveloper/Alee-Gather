local AG=AleeGather
local mapPins,miniPins={},{}
local mapPool,miniPool={},{}


local function isExternallyManagedMinimapButton(button)
  if not button or not Minimap then return false end
  local parent=button:GetParent()
  return parent and parent~=Minimap
end

local function showNodeTooltip(pin,anchor)
  if not pin or not pin.nodeID then return end
  GameTooltip:SetOwner(anchor or pin,"ANCHOR_RIGHT")
  GameTooltip:ClearLines()
  local n=AG.Nodes[pin.nodeID]
  GameTooltip:AddLine(AG:GetNodeName(pin.nodeID),1,1,1)
  if n and n.skill and n.skill>0 then
    GameTooltip:AddLine(AG:L("LEVEL")..": "..n.skill,0.95,0.82,0.25)
  end
  if pin.state=="depleted" then
    GameTooltip:AddLine(AG:L("STATE_DEPLETED"),1,0.2,0.2)
    if pin.depletedUntil and pin.depletedUntil>time() then
      local left=math.ceil((pin.depletedUntil-time())/60)
      GameTooltip:AddLine(AG:L("RESPAWN_ESTIMATE")..": ~"..left.." min",0.85,0.75,0.45)
    end
  else
    GameTooltip:AddLine(AG:L("STATE_AVAILABLE"),0.25,1,0.35)
  end
  GameTooltip:Show()
end


local function applyState(pin,rec)
  local state=AG:GetNodeState(rec)
  pin.state=state

  if not AG.db.profile.statusRings then
    pin.ring:SetAlpha(0)
    pin.ring:Hide()
    return
  end

  if state=="depleted" then
    pin.ring:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\StatusRingBlack.tga")
  else
    pin.ring:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\StatusRingGreen.tga")
  end

  pin.ring:SetVertexColor(1,1,1,1)
  pin.ring:Show()
end

local function setupPinFrame(f,parent,size)
  f:SetParent(parent)
  f:SetWidth(size); f:SetHeight(size)
  f.ring:SetWidth(size); f.ring:SetHeight(size)
  f.icon:SetWidth(size*0.78); f.icon:SetHeight(size*0.78)
  f.icon:SetTexCoord(0,1,0,1)
  f.icon:SetVertexColor(1,1,1,1)
  f:Show()
end

local function createPinBase(frameType,parent,mouseEnabled)
  local f=CreateFrame(frameType,nil,parent)
  f.ring=f:CreateTexture(nil,"ARTWORK")
  f.ring:SetPoint("CENTER")
  f.ring:Hide()
  f.icon=f:CreateTexture(nil,"OVERLAY")
  f.icon:SetPoint("CENTER")
  f:EnableMouse(mouseEnabled and true or false)

  if mouseEnabled then
    f:SetScript("OnEnter",function(self)
      if self.nodeID then showNodeTooltip(self,self) end
    end)
    f:SetScript("OnLeave",function() GameTooltip:Hide() end)
  end
  return f
end

local function acquireMapPin(pool,parent,size)
  local f=table.remove(pool)
  if not f then
    f=createPinBase("Frame",parent,false)
  end
  setupPinFrame(f,parent,size)
  f:EnableMouse(false)
  if parent.GetFrameLevel then
    f:SetFrameLevel((parent:GetFrameLevel() or 1)+1)
  end
  return f
end

-- IMPORTANTE:
-- Los nodos del minimapa son Frames, NO Buttons.
-- DragonflightUI y otros recolectores/skins de minimapa suelen decorar
-- automáticamente los Button hijos del Minimap con un borde circular blanco.
local function acquireMiniPin(pool,parent,size)
  local f=table.remove(pool)
  if not f then
    f=createPinBase("Frame",parent,true)
  end
  setupPinFrame(f,parent,size)
  if parent.GetFrameLevel then
    f:SetFrameLevel((parent:GetFrameLevel() or 1)+5)
  end
  return f
end

local function releaseAll(active,pool)
  for i=#active,1,-1 do
    local f=active[i]
    f:Hide(); f:ClearAllPoints()
    f.nodeID=nil; f.state=nil; f.depletedUntil=nil; f.mapX=nil; f.mapY=nil
    if f.ring then
      f.ring:Hide()
      f.ring:SetAlpha(0)
      f.ring:SetVertexColor(1,1,1,1)
    end
    table.insert(pool,f); active[i]=nil
  end
end

function AG:InitializeDisplay()
  self.display=CreateFrame("Frame")
  self.display:RegisterEvent("WORLD_MAP_UPDATE")
  self.display:RegisterEvent("MINIMAP_UPDATE_ZOOM")
  self.display:SetScript("OnEvent",function(_,event)
    if event=="WORLD_MAP_UPDATE" then AG:RefreshWorldMap() end
  end)

  local elapsed=0
  self.display:SetScript("OnUpdate",function(_,e)
    elapsed=elapsed+e
    if elapsed>0.12 then
      elapsed=0
      AG:RefreshMinimap()
    end
  end)

  if WorldMapFrame and WorldMapFrame.HookScript then
    WorldMapFrame:HookScript("OnShow",function() AG:RefreshWorldMap() end)
    WorldMapFrame:HookScript("OnHide",function() releaseAll(mapPins,mapPool) end)
  end
  self:CreateMinimapButton()
end

function AG:GetIconForNode(id)
  if self.GetNodeTexture then return self:GetNodeTexture(id) end
  local n=self.Nodes[id]
  return n and self.categoryIcons[n.category] or self.categoryIcons["Treasure"]
end

function AG:RefreshWorldMap()
  releaseAll(mapPins,mapPool)
  if not self.db or not self.db.profile.showMap or not WorldMapFrame or not WorldMapFrame:IsShown() then return end
  local zone=GetMapInfo()
  if not zone or GetCurrentMapZone()==0 then return end
  local z=self.db.nodes[zone]
  if not z then return end
  local w,h=WorldMapButton:GetWidth(),WorldMapButton:GetHeight()
  if not w or w<=0 or not h or h<=0 then return end
  local size=18*self.db.profile.mapScale
  local count=0
  for p,rec in pairs(z) do
    if count>=1000 then break end
    local id=type(rec)=="table" and rec.id or rec
    local n=self.Nodes[id]
    if n and self:IsCategoryEnabled(n.category) and self:PassesSkillFilter(id) then
      local x,y=self:UnpackCoord(p)
      local f=acquireMapPin(mapPool,WorldMapButton,size)
      f.nodeID=id
      f.mapX=x
      f.mapY=y
      f.depletedUntil=type(rec)=="table" and rec.depletedUntil or nil
      f.icon:SetTexture(self:GetIconForNode(id))
      local mapAlpha=tonumber(self.db.profile.mapAlpha) or tonumber(self.db.profile.alpha) or 0.95
      f.icon:SetAlpha(mapAlpha)
      applyState(f,rec)
      if self.db.profile.statusRings then
        f.ring:SetAlpha(mapAlpha)
      else
        f.ring:SetAlpha(0)
        f.ring:Hide()
      end
      f:SetPoint("CENTER",WorldMapButton,"TOPLEFT",x*w,-y*h)
      table.insert(mapPins,f)
      count=count+1
    end
  end
end

local function rotate(dx,dy,a)
  local ca,sa=math.cos(a),math.sin(a)
  return dx*ca-dy*sa, dx*sa+dy*ca
end

function AG:RefreshMinimap()
  releaseAll(miniPins,miniPool)
  if not self.db or not self.db.profile.showMinimap or not Minimap or not Minimap:IsShown() then return end
  local zone,px,py=self:GetPlayerPosition()
  if not zone then return end
  local z=self.db.nodes[zone]
  local s=self.ZoneSize[zone]
  if not z or not s then return end

  local zoom=Minimap:GetZoom() or 0
  local diam=(self.MinimapDiameterYards.outdoor[zoom] or 200)
  local radius=diam/2
  local mw,mh=Minimap:GetWidth()/2,Minimap:GetHeight()/2
  local rotateMap=(GetCVar("rotateMinimap")=="1")
  local facing=(GetPlayerFacing and GetPlayerFacing()) or 0
  local size=16*self.db.profile.miniScale
  local count=0

  for p,rec in pairs(z) do
    if count>=220 then break end
    local id=type(rec)=="table" and rec.id or rec
    local n=self.Nodes[id]
    if n and self:IsCategoryEnabled(n.category) and self:PassesSkillFilter(id) then
      local x,y=self:UnpackCoord(p)
      local dx=(x-px)*s[1]
      local dy=(y-py)*s[2]
      if rotateMap then dx,dy=rotate(dx,dy,-facing) end
      local dist=math.sqrt(dx*dx+dy*dy)
      if dist<=radius*1.05 then
        local ox=(dx/radius)*mw
        local oy=-(dy/radius)*mh
        local nx,ny=ox/mw,oy/mh
        local rr=math.sqrt(nx*nx+ny*ny)
        if rr>0.94 then ox=ox*(0.94/rr); oy=oy*(0.94/rr) end
        local f=acquireMiniPin(miniPool,Minimap,size)
        f.nodeID=id
        f.depletedUntil=type(rec)=="table" and rec.depletedUntil or nil
        f.icon:SetTexture(self:GetIconForNode(id))
        local nodeState=self:GetNodeState(rec)
        local nodeAlpha=self.db.profile.alpha
        if nodeState=="depleted" then
          nodeAlpha=tonumber(self.db.profile.depletedMiniAlpha) or 0.30
        end
        f.icon:SetAlpha(nodeAlpha)
        applyState(f,rec)
        if self.db.profile.statusRings then
          f.ring:SetAlpha(nodeAlpha)
        else
          f.ring:SetAlpha(0)
          f.ring:Hide()
        end
        f:SetPoint("CENTER",Minimap,"CENTER",ox,oy)
        table.insert(miniPins,f)
        count=count+1
      end
    end
  end
end

function AG:CreateMinimapButton()
  local b=CreateFrame("Button","AleeGatherMinimapButton",Minimap)
  self.minimapButton=b
  b:SetWidth(32); b:SetHeight(32); b:SetFrameStrata("MEDIUM")
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
    GameTooltip:AddLine(AG:L("LEFT_CONFIG"),1,1,1)
    GameTooltip:AddLine(AG:L("RIGHT_RADAR"),0.8,0.8,0.8)
    GameTooltip:Show()
  end)
  b:SetScript("OnLeave",function() GameTooltip:Hide() end)
  self:PositionMinimapButton()
end

function AG:PositionMinimapButton()
  if not self.minimapButton or not self.db then return end

  -- Minimap-button collectors (DragonflightUI, MBB-style addons, etc.) commonly
  -- reparent buttons into their own container. If that happened, AleeGather must
  -- not pull the button back to the minimap.
  if isExternallyManagedMinimapButton(self.minimapButton) then
    if self.db.profile.showButton then self.minimapButton:Show() else self.minimapButton:Hide() end
    return
  end

  local a=math.rad(self.db.profile.minimapButtonAngle or 220)
  local r=82
  self.minimapButton:ClearAllPoints()
  self.minimapButton:SetPoint("CENTER",Minimap,"CENTER",math.cos(a)*r,math.sin(a)*r)
  if self.db.profile.showButton then self.minimapButton:Show() else self.minimapButton:Hide() end
end

function AG:UpdateMinimapButtonFromCursor()
  if isExternallyManagedMinimapButton(self.minimapButton) then return end
  local mx,my=Minimap:GetCenter()
  local scale=Minimap:GetEffectiveScale()
  local cx,cy=GetCursorPosition(); cx=cx/scale; cy=cy/scale
  local a=math.deg(math.atan2(cy-my,cx-mx))
  self.db.profile.minimapButtonAngle=a
  self:PositionMinimapButton()
end

function AG:RefreshAll()
  self:PositionMinimapButton()
  self:RefreshWorldMap()
  self:RefreshMinimap()
  if self.RefreshHUD then self:RefreshHUD() end
  if self.RefreshRadar then self:RefreshRadar() end
  if self.RefreshConfig then self:RefreshConfig() end
end
