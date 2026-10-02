local AG=AleeGather
local radarPins,radarPool={},{}

local function clamp(v,lo,hi)
  if v<lo then return lo end
  if v>hi then return hi end
  return v
end

local function rotate(dx,dy,a)
  local ca,sa=math.cos(a),math.sin(a)
  return dx*ca-dy*sa, dx*sa+dy*ca
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

local function acquire(parent,size)
  local f=table.remove(radarPool)
  if not f then
    f=CreateFrame("Button",nil,parent)
    f.ring=f:CreateTexture(nil,"ARTWORK")
    f.ring:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\StatusRingGreen.tga")
    f.ring:SetPoint("CENTER")
    f.icon=f:CreateTexture(nil,"OVERLAY")
    f.icon:SetPoint("CENTER")
    f:EnableMouse(true)
    f:SetScript("OnEnter",function(self)
      if self.nodeID then
        GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
        local n=AG.Nodes[self.nodeID]
        GameTooltip:AddLine(AG:GetNodeName(self.nodeID),1,1,1)
        if n and n.skill and n.skill>0 then
          GameTooltip:AddLine(AG:L("LEVEL")..": "..n.skill,0.95,0.82,0.25)
        end
        if self.distance then GameTooltip:AddLine(string.format("%.0f yd",self.distance),0.7,0.85,1) end
        if self.state=="depleted" then
          GameTooltip:AddLine(AG:L("STATE_DEPLETED"),1,0.2,0.2)
        else
          GameTooltip:AddLine(AG:L("STATE_AVAILABLE"),0.25,1,0.35)
        end
        GameTooltip:Show()
      end
    end)
    f:SetScript("OnLeave",function() GameTooltip:Hide() end)
  end
  f:SetParent(parent)
  if parent.GetFrameLevel then f:SetFrameLevel((parent:GetFrameLevel() or 1)+10) end
  f:SetWidth(size); f:SetHeight(size)
  f.ring:SetWidth(size); f.ring:SetHeight(size)
  f.icon:SetWidth(size*0.68); f.icon:SetHeight(size*0.68)
  f.ring:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\StatusRingGreen.tga")
  f.ring:SetVertexColor(0.20,1.0,0.30,1.0)
  f.ring:SetAlpha(0)
  f.ring:Hide()
  f.icon:SetVertexColor(1,1,1,1)
  f:Show()
  return f
end

local function releaseAll()
  for i=#radarPins,1,-1 do
    local f=radarPins[i]
    f:Hide(); f:ClearAllPoints(); f.nodeID=nil; f.distance=nil; f.state=nil
    if f.ring then
      f.ring:Hide()
      f.ring:SetAlpha(0)
      f.ring:SetVertexColor(1,1,1,1)
    end
    table.insert(radarPool,f); radarPins[i]=nil
  end
end

local function smallButton(parent,w,text,tip,callback)
  local b=CreateFrame("Button",nil,parent,"UIPanelButtonTemplate")
  b:SetWidth(w); b:SetHeight(19); b:SetText(text)
  b:SetScript("OnClick",callback)
  b:SetScript("OnEnter",function(self)
    if tip then
      GameTooltip:SetOwner(self,"ANCHOR_TOP")
      GameTooltip:AddLine(tip,1,1,1)
      GameTooltip:Show()
    end
  end)
  b:SetScript("OnLeave",function() GameTooltip:Hide() end)
  return b
end

function AG:RadarZoom(delta)
  local cfg=self.db.profile.radar
  cfg.range=clamp((cfg.range or 700)+delta,100,3000)
  self:RefreshRadar()
  if self.RefreshConfig then self:RefreshConfig() end
end

function AG:RadarResize(delta)
  local cfg=self.db.profile.radar
  cfg.size=clamp((cfg.size or 260)+delta,180,500)
  self:RefreshRadar()
  if self.RefreshConfig then self:RefreshConfig() end
end

function AG:InitializeRadar()
  local f=CreateFrame("Frame","AleeGatherRadar",UIParent)
  self.radar=f
  local size=self.db.profile.radar.size or 260
  f:SetWidth(size); f:SetHeight(size)
  f:SetPoint("CENTER",UIParent,"CENTER",self.db.profile.radar.x or 320,self.db.profile.radar.y or 20)
  f:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",tile=true,tileSize=32,edgeSize=32,insets={left=11,right=12,top=12,bottom=11}})
  f:SetBackdropColor(0.02,0.03,0.04,self.db.profile.radar.opacity or 0.82)
  f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self) if not AG.db.profile.radar.locked then self:StartMoving() end end)
  f:SetScript("OnDragStop",function(self)
    self:StopMovingOrSizing()
    local cx,cy=self:GetCenter(); local ux,uy=UIParent:GetCenter()
    if cx and ux then AG.db.profile.radar.x=cx-ux; AG.db.profile.radar.y=cy-uy end
  end)

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.title:SetPoint("TOPLEFT",18,-16)
  f.title:SetText("|cff55dd88AleeGather|r Radar")
  f.range=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.range:SetPoint("TOPRIGHT",-18,-17)

  -- Controls: zoom changes yard range, size changes the physical radar window.
  f.zoomOut=smallButton(f,24,"-","Zoom -",function() AG:RadarZoom(100) end)
  f.zoomOut:SetPoint("BOTTOMLEFT",18,16)
  f.zoomIn=smallButton(f,24,"+","Zoom +",function() AG:RadarZoom(-100) end)
  f.zoomIn:SetPoint("LEFT",f.zoomOut,"RIGHT",3,0)

  f.sizeDown=smallButton(f,34,"S-","Radar -",function() AG:RadarResize(-20) end)
  f.sizeDown:SetPoint("BOTTOMRIGHT",-55,16)
  f.sizeUp=smallButton(f,34,"S+","Radar +",function() AG:RadarResize(20) end)
  f.sizeUp:SetPoint("BOTTOMRIGHT",-18,16)

  f.crossH=f:CreateTexture(nil,"BACKGROUND"); f.crossH:SetTexture(1,1,1,0.10); f.crossH:SetHeight(1); f.crossH:SetPoint("LEFT",18,0); f.crossH:SetPoint("RIGHT",-18,0)
  f.crossV=f:CreateTexture(nil,"BACKGROUND"); f.crossV:SetTexture(1,1,1,0.10); f.crossV:SetWidth(1); f.crossV:SetPoint("TOP",0,-36); f.crossV:SetPoint("BOTTOM",0,36)
  f.ring1=f:CreateTexture(nil,"BACKGROUND"); f.ring1:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\Ring.tga"); f.ring1:SetPoint("CENTER",0,0); f.ring1:SetWidth(size*0.44); f.ring1:SetHeight(size*0.44); f.ring1:SetAlpha(0.16)
  f.ring2=f:CreateTexture(nil,"BACKGROUND"); f.ring2:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\Ring.tga"); f.ring2:SetPoint("CENTER",0,0); f.ring2:SetWidth(size*0.78); f.ring2:SetHeight(size*0.78); f.ring2:SetAlpha(0.12)

  f.player=f:CreateTexture(nil,"OVERLAY")
  f.player:SetTexture("Interface\\Buttons\\WHITE8X8")
  f.player:SetVertexColor(1.0,0.82,0.10,1.0)
  f.player:SetWidth(8); f.player:SetHeight(8)
  f.player:SetPoint("CENTER",0,0)

  local nodesElapsed=0
  f:SetScript("OnUpdate",function(_,e)
    nodesElapsed=nodesElapsed+e
    if nodesElapsed>=0.25 then
      nodesElapsed=0
      AG:RefreshRadarNodes()
    end
  end)
  self:RefreshRadar()
end

function AG:RefreshRadarNodes()
  releaseAll()
  local f=self.radar
  if not f or not self.db then return end
  local cfg=self.db.profile.radar
  if not cfg.enabled then f:Hide(); return end
  f:Show()

  local size=cfg.size or 260
  f:SetWidth(size); f:SetHeight(size)
  f:SetBackdropColor(0.02,0.03,0.04,cfg.opacity or 0.82)
  f.ring1:SetWidth(size*0.44); f.ring1:SetHeight(size*0.44)
  f.ring2:SetWidth(size*0.78); f.ring2:SetHeight(size*0.78)

  local radius=cfg.range or 700
  f.range:SetText(radius.." yd")

  local zone,px,py=self:GetPlayerPosition()
  if not zone then return end
  local z=self.db.nodes[zone]
  local zs=self.ZoneSize[zone]
  if not z or not zs then return end

  local rotateMap=(GetCVar("rotateMinimap")=="1")
  local facing=(GetPlayerFacing and GetPlayerFacing()) or 0
  local usable=(size/2)-30
  local count=0

  for packed,rec in pairs(z) do
    if count>=260 then break end
    local id=type(rec)=="table" and rec.id or rec
    local n=self.Nodes[id]
    if n and self:IsCategoryEnabled(n.category) and self:PassesSkillFilter(id) then
      local x,y=self:UnpackCoord(packed)
      local dx=(x-px)*zs[1]
      local dy=(y-py)*zs[2]
      local dist=math.sqrt(dx*dx+dy*dy)

      if dist<=radius then
        -- Same rule as the minimap: only rotate world points when rotateMinimap is on.
        if rotateMap then
          dx,dy=rotate(dx,dy,-facing)
        end

        local ox=(dx/radius)*usable
        local oy=-(dy/radius)*usable
        local pin=acquire(f,20*(cfg.iconScale or 1.0))
        pin.nodeID=id
        pin.distance=dist
        pin.icon:SetTexture(self:GetIconForNode(id))
        pin.icon:SetAlpha(cfg.iconAlpha or 0.95)
        applyState(pin,rec)
        if self.db.profile.statusRings then
          pin.ring:SetAlpha(cfg.iconAlpha or 0.95)
        else
          pin.ring:SetAlpha(0)
          pin.ring:Hide()
        end
        pin:SetPoint("CENTER",f,"CENTER",ox,oy)
        table.insert(radarPins,pin)
        count=count+1
      end
    end
  end
end

function AG:RefreshRadar()
  local f=self.radar
  if not f or not self.db then return end
  if not self.db.profile.radar.enabled then
    releaseAll()
    f:Hide()
    return
  end

  f:Show()
  self:RefreshRadarNodes()
end
