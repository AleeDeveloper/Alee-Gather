local AG=AleeGather
local pins,pool={},{}

local function clamp(v,lo,hi)
  if v<lo then return lo end
  if v>hi then return hi end
  return v
end

local function rotate(dx,dy,a)
  local ca,sa=math.cos(a),math.sin(a)
  return dx*ca-dy*sa,dx*sa+dy*ca
end

local function releaseAll()
  for i=#pins,1,-1 do
    local f=pins[i]
    f:Hide(); f:ClearAllPoints(); f.rec=nil; f.distance=nil
    table.insert(pool,f); pins[i]=nil
  end
end

local function acquire(parent,size)
  local f=table.remove(pool)
  if not f then
    f=CreateFrame("Frame",nil,parent)
    f.icon=f:CreateTexture(nil,"OVERLAY")
    f.icon:SetAllPoints(f)
    f:EnableMouse(true)
    f:SetScript("OnEnter",function(self)
      if self.rec then AG:ShowNodeTooltip(self,self.rec,self.distance,"auto") end
    end)
    f:SetScript("OnLeave",function() AG:HideNodeTooltip() end)
  end
  f:SetParent(parent)
  f:SetWidth(size); f:SetHeight(size)
  if parent.GetFrameLevel then f:SetFrameLevel((parent:GetFrameLevel() or 1)+10) end
  f:Show()
  return f
end

local function smallButton(parent,width,text,tipKey,callback)
  local b=AG:CreateThemedButton(parent,width,20,callback)
  b:SetText(text)
  b:SetScript("OnEnter",function(self)
    GameTooltip:SetOwner(self,"ANCHOR_TOP")
    GameTooltip:AddLine(AG:L(tipKey),1,1,1)
    GameTooltip:Show()
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
  local cfg=self.db.profile.radar
  local f=CreateFrame("Frame","AleeGatherRadar",UIParent)
  self.radar=f

  f:SetWidth(cfg.size or 260); f:SetHeight(cfg.size or 260)
  f:SetPoint("CENTER",UIParent,"CENTER",cfg.x or 320,cfg.y or 20)
  self:ApplyWindowStyle(f,cfg.opacity or 0.72)
  f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self)
    if not AG.db.profile.radar.locked then self:StartMoving() end
  end)
  f:SetScript("OnDragStop",function(self)
    self:StopMovingOrSizing()
    local x,y=self:GetCenter(); local ux,uy=UIParent:GetCenter()
    if x and ux then cfg.x=x-ux; cfg.y=y-uy end
  end)

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.title:SetPoint("TOPLEFT",20,-18)
  f.title:SetText("|cff55dd88AleeGather|r Radar")

  f.range=f:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
  f.range:SetPoint("TOPRIGHT",-20,-19)

  -- Restored controls from the stable radar.
  f.zoomOut=smallButton(f,24,"-","RADAR_ZOOM_OUT",function() AG:RadarZoom(100) end)
  f.zoomOut:SetPoint("BOTTOMLEFT",20,18)
  f.zoomIn=smallButton(f,24,"+","RADAR_ZOOM_IN",function() AG:RadarZoom(-100) end)
  f.zoomIn:SetPoint("LEFT",f.zoomOut,"RIGHT",3,0)

  f.sizeDown=smallButton(f,34,"S-","RADAR_SIZE_DOWN",function() AG:RadarResize(-20) end)
  f.sizeDown:SetPoint("BOTTOMRIGHT",-57,18)
  f.sizeUp=smallButton(f,34,"S+","RADAR_SIZE_UP",function() AG:RadarResize(20) end)
  f.sizeUp:SetPoint("BOTTOMRIGHT",-20,18)

  -- Radar grid/rings. These are decorative range references, NOT node-status rings.
  f.crossH=f:CreateTexture(nil,"BACKGROUND")
  f.crossH:SetTexture(1,1,1,0.10)
  f.crossH:SetHeight(1); f.crossH:SetPoint("LEFT",18,0); f.crossH:SetPoint("RIGHT",-18,0)

  f.crossV=f:CreateTexture(nil,"BACKGROUND")
  f.crossV:SetTexture(1,1,1,0.10)
  f.crossV:SetWidth(1); f.crossV:SetPoint("TOP",0,-52); f.crossV:SetPoint("BOTTOM",0,38)

  f.ring1=f:CreateTexture(nil,"BACKGROUND")
  f.ring1:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\Ring.tga")
  f.ring1:SetPoint("CENTER"); f.ring1:SetAlpha(0.16)

  f.ring2=f:CreateTexture(nil,"BACKGROUND")
  f.ring2:SetTexture("Interface\\AddOns\\AleeGather\\Artwork\\Ring.tga")
  f.ring2:SetPoint("CENTER"); f.ring2:SetAlpha(0.12)

  f.player=f:CreateTexture(nil,"OVERLAY")
  f.player:SetTexture("Interface\\Buttons\\WHITE8X8")
  f.player:SetVertexColor(1.0,0.82,0.10,1.0)
  f.player:SetWidth(8); f.player:SetHeight(8)
  f.player:SetPoint("CENTER")

  f.empty=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
  f.empty:SetPoint("CENTER",0,-22)
  f.empty:SetWidth(190)
  f.empty:SetJustifyH("CENTER")
  f.empty:Hide()

  local elapsed=0
  f:SetScript("OnUpdate",function(_,dt)
    elapsed=elapsed+dt
    if elapsed>=0.25 then
      elapsed=0
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
  self:ApplyWindowStyle(f,cfg.opacity or 0.72)

  local size=cfg.size or 260
  f:SetWidth(size); f:SetHeight(size)
  f.ring1:SetWidth(size*0.44); f.ring1:SetHeight(size*0.44)
  f.ring2:SetWidth(size*0.78); f.ring2:SetHeight(size*0.78)

  local radius=cfg.range or 700
  f.range:SetText(radius.." yd")

  local zone,px,py=self:GetPlayerPosition()
  local zs=zone and self.ZoneSize[zone]
  if not zs then
    f.empty:SetText(self:L("NO_NODES_RANGE"))
    f.empty:Show()
    return
  end

  local rotateMap=(GetCVar("rotateMinimap")=="1")
  local facing=(GetPlayerFacing and GetPlayerFacing()) or 0
  local usable=(size/2)-34
  local count=0

  self:ForEachNearbyNode(zone,px,py,radius,function(rec)
    local cat=self:GetRecordCategory(rec)
    if not cat or not self:IsCategoryEnabled(cat) or not self:PassesSkillFilterRecord(rec) then return end

    local x,y=self:GetRecordXY(rec)
    local dx=(x-px)*zs[1]
    local dy=(y-py)*zs[2]
    local dist=math.sqrt(dx*dx+dy*dy)
    if dist>radius then return end

    if rotateMap then dx,dy=rotate(dx,dy,-facing) end

    local ox=(dx/radius)*usable
    local oy=-(dy/radius)*usable
    local p=acquire(f,18*(cfg.iconScale or 1))
    p.rec=rec
    p.distance=dist
    p.icon:SetTexture(self:GetRecordIcon(rec) or self.categoryIcons[cat])
    p.icon:SetAlpha(cfg.iconAlpha or 0.95)
    p:SetPoint("CENTER",f,"CENTER",ox,oy)
    pins[#pins+1]=p
    count=count+1
  end)

  if count==0 then
    f.empty:SetText(self:L("NO_NODES_RANGE"))
    f.empty:Show()
  else
    f.empty:Hide()
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
