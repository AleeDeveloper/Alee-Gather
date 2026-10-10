local AG=AleeGather
local floor=math.floor;local CAT={[1]="Mining",[2]="Herb Gathering",[3]="Fishing"};local WOTLK={BoreanTundra=true,Dragonblight=true,GrizzlyHills=true,HowlingFjord=true,IcecrownGlacier=true,SholazarBasin=true,TheStormPeaks=true,ZulDrak=true,LakeWintergrasp=true,CrystalsongForest=true,HrothgarsLanding=true}
local function normNodeName(s)
  s=string.lower(tostring(s or ""))
  s=string.gsub(s,"[%p%c]"," ")
  s=string.gsub(s,"%s+"," ")
  s=string.gsub(s,"^%s+","")
  s=string.gsub(s,"%s+$","")
  return s
end

function AG:InitializeDatabase()
  self.staticDB=AleeGatherStaticDB or {}
  self.staticTypes=AleeGatherStaticTypes or {}
  self.pfIcons=AleeGatherPfQuestIcons or {}
  self._professionCache=nil

  -- Build a direct AleeGather node -> pfQuest icon lookup.
  -- StaticTypes use real gameobject IDs, while AG.Nodes uses AleeGather IDs;
  -- comparing those numbers directly caused the duplicate learned-node bug.
  self.learnedPfIcons={}
  self.staticNodeSkill={}
  local staticByName={}
  local nodeByNormalizedName={}

  for nodeID,node in pairs(self.Nodes or {}) do
    if node and node.en then
      nodeByNormalizedName[(node.category or "").."|"..normNodeName(node.en)]=nodeID
    end
  end
  for typeID,t in pairs(self.staticTypes) do
    if t and t[5] then
      local cat=CAT[t[2]]
      local key=normNodeName(t[5])
      if key~="" then
        staticByName[cat.."|"..key]=t

        -- Some pfQuest static entries have skill 0 even though the real
        -- gathering requirement is known (for example Peacebloom/Silverleaf).
        -- Resolve those records through AleeGather's Nodes.lua so skill-based
        -- filtering works consistently on static nodes too.
        local nodeID=nodeByNormalizedName[cat.."|"..key]
        local node=nodeID and self.Nodes[nodeID]
        if node and tonumber(node.skill) and tonumber(node.skill)>0 then
          self.staticNodeSkill[typeID]=tonumber(node.skill)
        end
      end
    end
  end

  for id,n in pairs(self.Nodes or {}) do
    local t=staticByName[(n.category or "").."|"..normNodeName(n.en)]
    if t and self.pfIcons[t[4]] then
      self.learnedPfIcons[id]=self.pfIcons[t[4]]
    end
  end

  -- Generic pfQuest category artwork for learned WotLK nodes that do not
  -- have an exact Classic/TBC icon in pfQuest.
  self.learnedPfFallback={
    ["Mining"]=self.pfIcons[1],
    ["Herb Gathering"]=self.pfIcons[14],
    ["Fishing"]=self.pfIcons[50],
  }

  -- v0.87 intentionally preserves old SavedVariables.
  -- Classic/TBC learned Mining/Herbalism/Fishing records are simply ignored
  -- by GetLearnedRecords() instead of being deleted.
end
function AG:PackCoord(x,y)return floor(x*10000+.5)*10000+floor(y*10000+.5)end
function AG:UnpackCoord(p)local xi=floor(p/10000);return xi/10000,(p-xi*10000)/10000 end
function AG:IsWotLKZone(z)return WOTLK[z]and true or false end
function AG:DistanceYards(z,x1,y1,x2,y2)local s=self.ZoneSize[z];if not s then return nil end;local dx=(x2-x1)*s[1];local dy=(y2-y1)*s[2];return math.sqrt(dx*dx+dy*dy)end
function AG:GetRecordCategory(r)if r.static then local t=self.staticTypes[r.typeID];return t and CAT[t[2]]end;local n=self.Nodes[r.id];return n and n.category end
function AG:GetRecordName(r)if r.static then local t=self.staticTypes[r.typeID];return t and t[5]or"Node"end;return self:GetNodeName(r.id)end
function AG:GetRecordSkill(r)
  if r.static then
    local t=self.staticTypes[r.typeID]
    if not t then return 0 end

    -- Prefer AleeGather's canonical requirement when the static pfQuest
    -- type can be matched by name. This fixes old static rows with skill=0.
    local mapped=self.staticNodeSkill and self.staticNodeSkill[r.typeID]
    if mapped and mapped>0 then
      return mapped
    end

    return tonumber(t[3]) or 0
  end

  local n=self.Nodes[r.id]
  return n and (tonumber(n.skill) or 0) or 0
end
function AG:GetLearnedNodeIcon(id)
  if id and self.learnedPfIcons and self.learnedPfIcons[id] then
    return self.learnedPfIcons[id]
  end
  local n=id and self.Nodes[id]
  local cat=n and n.category
  if cat and self.learnedPfFallback and self.learnedPfFallback[cat] then
    return self.learnedPfFallback[cat]
  end
  return cat and self.categoryIcons[cat] or nil
end

function AG:GetRecordIcon(r)
  if r.static then
    local t=self.staticTypes[r.typeID]
    if t then return self.pfIcons[t[4]] end
  end
  if r.learned and r.id then
    return self:GetLearnedNodeIcon(r.id)
  end
  return self.categoryIcons[self:GetRecordCategory(r)]
end
function AG:GetRecordXY(r)return self:UnpackCoord(r.p)end
function AG:GetNodeState(r)if r.static then return"available"end;if r.depletedUntil and r.depletedUntil>time()then return"depleted"end;return"available"end
AG.professionSpells={["Mining"]=2575,["Herb Gathering"]=2366,["Fishing"]=7620,["Extract Gas"]=4036,["Skinning"]=8613}
function AG:InvalidateProfessionCache()self._professionCache=nil end
function AG:BuildProfessionCache()local c={};local a={["mining"]="Mining",["minería"]="Mining",["mineria"]="Mining",["herbalism"]="Herb Gathering",["herb gathering"]="Herb Gathering",["herboristería"]="Herb Gathering",["herboristeria"]="Herb Gathering",["fishing"]="Fishing",["pesca"]="Fishing",["engineering"]="Extract Gas",["ingeniería"]="Extract Gas",["ingenieria"]="Extract Gas",["skinning"]="Skinning",["desuello"]="Skinning",["desollar"]="Skinning"};for i=1,(GetNumSkillLines()or 0)do local n,h,_,rank=GetSkillLineInfo(i);if n and not h then local low=string.lower(n);local cat=a[low];if not cat then if string.find(low,"miner",1,true)then cat="Mining"elseif string.find(low,"herb",1,true)then cat="Herb Gathering"elseif string.find(low,"fish",1,true)or string.find(low,"pesca",1,true)then cat="Fishing"elseif string.find(low,"engineer",1,true)or string.find(low,"ingenier",1,true)then cat="Extract Gas"elseif string.find(low,"skin",1,true)or string.find(low,"desoll",1,true)then cat="Skinning"end end;if cat then c[cat]={rank=tonumber(rank)or 0,icon=select(3,GetSpellInfo(self.professionSpells[cat]or 0)),name=n}end end end;self._professionCache=c;return c end
function AG:GetProfessionInfo(c)local p=self._professionCache or self:BuildProfessionCache();return p[c]end
function AG:HasProfessionForCategory(c)return self:GetProfessionInfo(c)~=nil end
function AG:IsProfessionToggleEnabled(c)
  local t=self.db and self.db.profile and self.db.profile.professionEnabled
  if type(t)~="table" or t[c]==nil then
    return self:HasProfessionForCategory(c)
  end
  return t[c] and true or false
end
function AG:SetProfessionToggle(c,v)
  self.db.profile.professionEnabled=self.db.profile.professionEnabled or {}
  self.db.profile.professionEnabled[c]=v and true or false
  if self.RefreshAll then self:RefreshAll() end
end
function AG:ResetProfessionToggles()
  self.db.profile.professionEnabled={}
  if self.RefreshAll then self:RefreshAll() end
end
function AG:IsCategoryEnabled(c)return self:IsProfessionToggleEnabled(c)end
function AG:PassesSkillFilterRecord(r)
  local hideAbove=self.db.profile.showOnlySkill
  local hideLow=self.db.profile.hideLowSkill
  if not hideAbove and not hideLow then return true end

  local s=self:GetRecordSkill(r)
  if not s or s<=0 then return true end

  local p=self:GetProfessionInfo(self:GetRecordCategory(r))
  if not p then
    if hideAbove then return false end
    return true
  end

  local rank=tonumber(p.rank) or 0

  -- Existing option: hide nodes that are still above the detected skill.
  if hideAbove and rank<s then
    return false
  end

  -- New option: hide old nodes that are over one 75-point profession band
  -- below the player's current detected skill.
  if hideLow and rank>0 then
    local minimum=math.max(1,rank-75)
    if s<minimum then
      return false
    end
  end

  return true
end
function AG:GetStaticRecords(id)local src=id and self.staticDB[id];local o={};if not src then return o end;for i=1,#src do local s=src[i];o[#o+1]={p=s[1],typeID=s[2],respawn=s[3],static=true}end;return o end
function AG:GetLearnedRecords(z)
  local src=self.db.learned[z]
  local o={}
  if not src then return o end

  local isWotLK=self:IsWotLKZone(z)

  for p,r in pairs(src) do
    if type(r)=="table" and r.id then
      local n=self.Nodes[r.id]
      local cat=n and n.category

      -- v0.75 behavior:
      -- Classic/TBC Mining/Herbalism/Fishing are supplied only by the
      -- bundled pfQuest static database. Old learned records are preserved
      -- in SavedVariables but hidden here.
      local allowed=true
      if not isWotLK and
         (cat=="Mining" or cat=="Herb Gathering" or cat=="Fishing") then
        allowed=false
      end

      if allowed then
        o[#o+1]={
          p=p,
          id=r.id,
          depletedUntil=r.depletedUntil,
          learned=true,
          source=r
        }
      end
    end
  end
  return o
end
function AG:GetWorldMapRecords()local o={};local id=self:GetSelectedStaticZoneID();if id then local a=self:GetStaticRecords(id);for i=1,#a do o[#o+1]=a[i]end end;local tok=GetMapInfo and GetMapInfo();if tok then local a=self:GetLearnedRecords(tok);for i=1,#a do o[#o+1]=a[i]end end;return o end
function AG:GetPlayerZoneRecords(z)local o={};local id=self._playerStaticZoneID or self:GetPlayerStaticZoneID(z);if id then local a=self:GetStaticRecords(id);for i=1,#a do o[#o+1]=a[i]end end;local a=self:GetLearnedRecords(z);for i=1,#a do o[#o+1]=a[i]end;return o end
function AG:ForEachNearbyNode(z,px,py,range,fn)local s=self.ZoneSize[z];if not s then return end;local recs=self:GetPlayerZoneRecords(z);for i=1,#recs do local r=recs[i];local x,y=self:GetRecordXY(r);local dx=(x-px)*s[1];local dy=(y-py)*s[2];if dx*dx+dy*dy<=(range*range)then if fn(r)==false then return end end end end
function AG:HasStaticNodeNear(z,id,x,y,exactYards,categoryYards)
  if not z or not id or not x or not y then return false end

  local node=self.Nodes[id]
  if not node then return false end
  local cat=node.category
  local wantedName=normNodeName(node.en)

  local staticZone=self:GetPlayerStaticZoneID(z)
  local src=staticZone and self.staticDB[staticZone]
  if not src then return false end

  exactYards=tonumber(exactYards) or 60
  categoryYards=tonumber(categoryYards) or 42

  for i=1,#src do
    local s=src[i]
    local t=self.staticTypes[s[2]]
    if t and CAT[t[2]]==cat then
      local sx,sy=self:UnpackCoord(s[1])
      local d=self:DistanceYards(z,x,y,sx,sy)
      if d then
        -- Same exact node type: allow a larger tolerance because the gather
        -- event gives us the player's position, not the gameobject position.
        if normNodeName(t[5])==wantedName and d<=exactYards then
          return true
        end

        -- Any pfQuest node of the same gathering category at the same physical
        -- spot means the location is already represented. Do not stack a
        -- learned marker on top of it.
        if d<=categoryYards then
          return true
        end
      end
    end
  end

  return false
end

function AG:ShouldLearnNode(z,c)
  -- Keep the stable v0.75 rule:
  -- Skinning and Gas are always learned because they do not have the same
  -- bundled static pfQuest coverage.
  if c=="Skinning" or c=="Extract Gas" then
    return true
  end

  -- Mining / Herbalism / Fishing:
  -- Classic + TBC = bundled static pfQuest database only.
  -- WotLK/Northrend = learn actual gathered locations and save them.
  if c=="Mining" or c=="Herb Gathering" or c=="Fishing" then
    return self:IsWotLKZone(z)
  end

  return false
end

function AG:PurgeLearnedStaticDuplicates()
  if not self.db or not self.db.learned then return 0 end

  local removed=0
  for zone,records in pairs(self.db.learned) do
    if type(records)=="table" and not self:IsWotLKZone(zone) then
      for p,r in pairs(records) do
        if type(r)=="table" and r.id then
          local n=self.Nodes[r.id]
          if n and (n.category=="Mining" or n.category=="Herb Gathering" or n.category=="Fishing") then
            local x,y=self:UnpackCoord(p)
            if self:HasStaticNodeNear(zone,r.id,x,y,60,42) then
              records[p]=nil
              removed=removed+1
            end
          end
        end
      end
    end
  end

  self._purgedLearnedStaticDuplicates=removed
  return removed
end

function AG:AddLearnedNode(id,z,x,y,src)local n=self.Nodes[id];if not n or not self:ShouldLearnNode(z,n.category,id,x,y)then return false,nil end;self.db.learned[z]=self.db.learned[z]or{};local t=self.db.learned[z];for p,r in pairs(t)do if r.id==id then local ox,oy=self:UnpackCoord(p);local d=self:DistanceYards(z,x,y,ox,oy);if d and d<=18 then r.seen=time();r.count=(r.count or 1)+1;return false,p end end end;local p=self:PackCoord(x,y);t[p]={id=id,seen=time(),count=1,source=src or"learned"};return true,p end
function AG:SetLearnedState(z,id,x,y,dep)local t=self.db.learned[z];if not t then return end;for p,r in pairs(t)do if r.id==id then local ox,oy=self:UnpackCoord(p);local d=self:DistanceYards(z,x,y,ox,oy);if d and d<=30 then r.depletedUntil=dep and(time()+(tonumber(self.db.profile.depletedSeconds)or 300))or nil;return end end end end
function AG:RecordSessionGather(c,n,a)a=tonumber(a)or 1;if a<1 then a=1 end;self.session.total=self.session.total+a;self.session.counts[c]=(self.session.counts[c]or 0)+a;self.session.last=n or"-";self:RefreshHUD()end
function AG:PrintDatabaseStats()local i=AleeGatherStaticInfo or{};local l=0;for _,z in pairs(self.db.learned or{})do for _ in pairs(z)do l=l+1 end end;self:Print(string.format("Static pfQuest: %d nodes / %d zones (Mining %d, Herbs %d, Fishing %d) | Learned %d",i.points or 0,i.zones or 0,i.mines or 0,i.herbs or 0,i.fish or 0,l))end
