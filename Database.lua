local AG=AleeGather
local floor=math.floor
function AG:InitializeDatabase() end

function AG:PackCoord(x,y)
  return floor(x*10000+0.5)*10000 + floor(y*10000+0.5)
end

function AG:UnpackCoord(p)
  local xi=floor(p/10000)
  local yi=p-xi*10000
  return xi/10000, yi/10000
end

function AG:DistanceYards(zone,x1,y1,x2,y2)
  local s=self.ZoneSize[zone]
  if not s then return nil end
  local dx=(x2-x1)*s[1]
  local dy=(y2-y1)*s[2]
  return math.sqrt(dx*dx+dy*dy)
end

AG.professionSpells = {
  ["Mining"] = 2575,
  ["Herb Gathering"] = 2366,
  ["Fishing"] = 7620,
  ["Extract Gas"] = 4036, -- Engineering; gas extraction also needs the extractor item in-game.
  ["Skinning"] = 8613,
}

function AG:InvalidateProfessionCache()
  self._professionCache=nil
end

function AG:BuildProfessionCache()
  local cache={}
  local names={}

  local function addName(name,category,icon)
    if not name or name=="" then return end
    names[string.lower(name)]={category=category,icon=icon}
  end

  -- Native spell names first. This covers the active game locale when the
  -- profession spell and the skill line use the same wording.
  for category,spellID in pairs(self.professionSpells) do
    local spellName,_,spellIcon=GetSpellInfo(spellID)
    if spellName then addName(spellName,category,spellIcon) end
  end

  -- WotLK 3.3.5a skill-line aliases. Some Spanish clients use a verb for
  -- Skinning ("Desollar") while the profession/spell can be translated
  -- differently ("Desuello"), so keep both.
  local aliases={
    ["mining"]="Mining", ["minería"]="Mining", ["mineria"]="Mining",
    ["herbalism"]="Herb Gathering", ["herb gathering"]="Herb Gathering",
    ["herboristería"]="Herb Gathering", ["herboristeria"]="Herb Gathering",
    ["fishing"]="Fishing", ["pesca"]="Fishing",
    ["engineering"]="Extract Gas", ["ingeniería"]="Extract Gas", ["ingenieria"]="Extract Gas",
    ["skinning"]="Skinning", ["desuello"]="Skinning", ["desollar"]="Skinning",
  }
  for name,category in pairs(aliases) do
    local icon=select(3,GetSpellInfo(self.professionSpells[category] or 0))
    addName(name,category,icon)
  end

  local function detectCategory(rawName)
    if not rawName then return nil end
    local lower=string.lower(rawName)
    local hit=names[lower]
    if hit then return hit end

    -- Extra tolerant fallback for localized/custom 3.3.5a clients.
    if string.find(lower,"desoll",1,true) or string.find(lower,"skinn",1,true) then
      return {category="Skinning",icon=select(3,GetSpellInfo(self.professionSpells["Skinning"]))}
    elseif string.find(lower,"miner",1,true) or string.find(lower,"mining",1,true) then
      return {category="Mining",icon=select(3,GetSpellInfo(self.professionSpells["Mining"]))}
    elseif string.find(lower,"herb",1,true) then
      return {category="Herb Gathering",icon=select(3,GetSpellInfo(self.professionSpells["Herb Gathering"]))}
    elseif string.find(lower,"pesc",1,true) or string.find(lower,"fish",1,true) then
      return {category="Fishing",icon=select(3,GetSpellInfo(self.professionSpells["Fishing"]))}
    elseif string.find(lower,"ingen",1,true) or string.find(lower,"engineer",1,true) then
      return {category="Extract Gas",icon=select(3,GetSpellInfo(self.professionSpells["Extract Gas"]))}
    end
    return nil
  end

  for i=1,GetNumSkillLines() do
    local name,isHeader,_,rank,_,_,maxRank = GetSkillLineInfo(i)
    if name and not isHeader then
      local hit=detectCategory(name)
      if hit then
        local info=cache[hit.category] or {}
        info.name=name
        info.rank=tonumber(rank) or 0
        info.maxRank=tonumber(maxRank) or 0
        info.icon=hit.icon or select(3,GetSpellInfo(self.professionSpells[hit.category] or 0))
        cache[hit.category]=info
      end
    end
  end

  self._professionCache=cache
  return cache
end

function AG:GetProfessionInfo(category)
  local cache=self._professionCache or self:BuildProfessionCache()
  return cache[category]
end

function AG:HasProfessionForCategory(category)
  if category=="Treasure" then return true end
  return self:GetProfessionInfo(category)~=nil
end

function AG:IsCategoryAllowedByProfession(cat)
  if not self.db then return true end
  -- Default behavior: only categories supported by this character's professions.
  -- Users can explicitly unlock the filter from Settings.
  if self.db.profile.unlockProfessionFilter then return true end
  return self:HasProfessionForCategory(cat)
end

function AG:IsCategoryEnabled(cat)
  if not self.db or self.db.profile.categories[cat] == false then return false end
  return self:IsCategoryAllowedByProfession(cat)
end

function AG:GetProfessionSkill(category)
  local info=self:GetProfessionInfo(category)
  return info and info.rank or nil
end

function AG:PassesSkillFilter(id)
  if not self.db.profile.showOnlySkill then return true end
  local n=self.Nodes[id]
  if not n or not n.skill or n.skill<=0 then return true end
  local skill=self:GetProfessionSkill(n.category)
  if not skill then return true end
  return skill>=n.skill
end


function AG:GetNodeState(rec)
  if type(rec)~="table" then return "available" end
  if rec.depletedUntil and rec.depletedUntil>time() then return "depleted" end
  return "available"
end

function AG:GetRespawnEstimate(id)
  local fallback=tonumber(self.db and self.db.profile and self.db.profile.depletedSeconds) or 300
  if not self.db or not self.db.profile.adaptiveRespawn then return fallback end
  local stats=self.db.respawnStats and self.db.respawnStats[id]
  local learned=stats and tonumber(stats.bestObserved) or nil
  if learned and learned>=30 and learned<=7200 then
    return learned
  end
  return fallback
end

function AG:LearnRespawnObservation(id,elapsed)
  if not self.db or not self.db.profile.adaptiveRespawn then return end
  elapsed=tonumber(elapsed)
  if not id or not elapsed or elapsed<30 or elapsed>7200 then return end
  self.db.respawnStats=self.db.respawnStats or {}
  local st=self.db.respawnStats[id] or {samples=0}
  st.samples=(st.samples or 0)+1
  st.lastObserved=math.floor(elapsed+0.5)
  if not st.bestObserved or elapsed<st.bestObserved then
    st.bestObserved=math.floor(elapsed+0.5)
  end
  if not st.averageObserved then
    st.averageObserved=elapsed
  else
    local n=math.min(st.samples,10)
    st.averageObserved=((st.averageObserved*(n-1))+elapsed)/n
  end
  self.db.respawnStats[id]=st
end

function AG:SetNodeState(zone,packed,state)
  local z=self.db.nodes[zone]
  if not z then return end
  local rec=z[packed]
  if type(rec)~="table" then
    rec={id=rec}
    z[packed]=rec
  end
  if state=="depleted" then
    local now=time()
    rec.lastGatheredAt=now
    rec.depletedUntil=now+self:GetRespawnEstimate(rec.id)
  else
    rec.depletedUntil=nil
  end
end

function AG:FindNearestNode(zone,id,x,y,maxDist)
  local z=self.db.nodes[zone]
  if not z then return nil,nil end
  local best,bestDist
  for p,rec in pairs(z) do
    local rid=type(rec)=="table" and rec.id or rec
    if rid==id then
      local ox,oy=self:UnpackCoord(p)
      local d=self:DistanceYards(zone,x,y,ox,oy)
      if d and d<=(maxDist or 25) and (not bestDist or d<bestDist) then
        best,bestDist=p,d
      end
    end
  end
  return best,bestDist
end

function AG:RecordSessionGather(category,name,amount)
  -- Pausing freezes only the timer. Gathering counters continue while the session is active.
  if not self.session or not self.session.active then return end
  amount=tonumber(amount) or 1
  if amount<1 then amount=1 end
  amount=math.floor(amount+0.5)
  self.session.total=(self.session.total or 0)+amount
  self.session.counts[category]=(self.session.counts[category] or 0)+amount
  self.session.last=name or "-"
  if self.RefreshHUD then self:RefreshHUD() end
end

function AG:AddNode(id,zone,x,y,source)
  if not id or not zone or not x or not y then return false,nil end
  local node=self.Nodes[id]
  if not node then return false,nil end
  local z=self.db.nodes[zone]
  if not z then z={} self.db.nodes[zone]=z end

  local nearby=self:FindNearestNode(zone,id,x,y,18)
  if nearby then
    local rec=z[nearby]
    if type(rec)~="table" then rec={id=id}; z[nearby]=rec end
    rec.seen=time()
    rec.count=(rec.count or 1)+1
    rec.source=source or rec.source
    rec.depletedUntil=nil
    if self.db.profile.debug then self:Print(self:L("DUPLICATE").." "..self:GetNodeName(id)) end
    return false,nearby
  end

  local p=self:PackCoord(x,y)
  z[p]={id=id,seen=time(),count=1,source=source or "learned"}
  if self.db.profile.debug then self:Print(self:L("LEARNED")..": "..self.session.last) end
  if self.RefreshAll then self:RefreshAll() end
  return true,p
end

function AG:MarkNodeDepleted(zone,id,x,y)
  if not zone or not id or not x or not y then return end
  local p=self:FindNearestNode(zone,id,x,y,30)
  if p then
    self:SetNodeState(zone,p,"depleted")
    if self.RefreshAll then self:RefreshAll() end
  end
end

function AG:MarkNodeAvailable(zone,id,x,y)
  if not zone or not id or not x or not y then return end
  local p=self:FindNearestNode(zone,id,x,y,30)
  if not p then return end
  local z=self.db.nodes[zone]
  local rec=z and z[p]
  if type(rec)=="table" and rec.lastGatheredAt then
    local elapsed=time()-rec.lastGatheredAt
    self:LearnRespawnObservation(rec.id or id,elapsed)
    rec.lastGatheredAt=nil
  end
  self:SetNodeState(zone,p,"available")
  if self.RefreshMinimap then self:RefreshMinimap() end
end

