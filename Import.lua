local AG=AleeGather

local legacyTables = {
  {name="Mining",          global="GatherMateDataMineDB"},
  {name="Herb Gathering", global="GatherMateDataHerbDB"},
  {name="Fishing",         global="GatherMateDataFishDB"},
  {name="Extract Gas",     global="GatherMateDataGasDB"},
  {name="Treasure",        global="GatherMateDataTreasureDB"},
}

function AG:ImportLegacyTables()
  -- AleeGather does not need the GatherMate addon itself. If the user only has
  -- GatherMate_Data installed, try to load that data addon directly.
  if not IsAddOnLoaded("GatherMate_Data") then
    local loaded = LoadAddOn("GatherMate_Data")
    if loaded and self.db.profile.debug then
      self:Print("GatherMate_Data loaded for import.")
    end
  end

  local total=0
  for _,spec in ipairs(legacyTables) do
    local src=_G[spec.global]
    if type(src)=="table" then
      for oldZone,points in pairs(src) do
        local zone=self.LegacyZoneMap[tonumber(oldZone)]
        if zone and type(points)=="table" then
          for packed,id in pairs(points) do
            if self.Nodes[id] then
              local x,y=self:UnpackCoord(tonumber(packed))
              if x and y then
                local z=self.db.nodes[zone]
                if not z then z={} self.db.nodes[zone]=z end
                local p=self:PackCoord(x,y)
                if not z[p] then
                  z[p]={id=id,seen=0,count=0,source="GatherMate_Data"}
                  total=total+1
                end
              end
            end
          end
        end
      end
    end
  end

  if total==0 then
    self:Print(self:L("IMPORT_NONE"))
  else
    self:Print(self:L("IMPORT_DONE")..": "..total)
    self:RefreshAll()
  end
  return total
end
