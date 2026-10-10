local AG = AleeGather
-- Physical zone dimensions in game yards. Values are compatible with the 3.3.5a
-- map coordinate system and are used only for accurate minimap placement.
AG.ZoneSize = {
  Ashenvale={5766.7289,3843.7223}, Aszhara={5070.8869,3381.2255}, AzuremystIsle={4070.8772,2714.5639},
  Barrens={10133.4423,6756.2019}, BloodmystIsle={3262.5356,2174.9842}, Darkshore={6550.0714,4366.6353},
  Darnassis={1058.3443,705.7245}, Desolace={4495.8826,2997.8951}, Durotar={5287.5564,3524.9751},
  Dustwallow={5250.0573,3499.9750}, Felwood={5750.0625,3833.3058}, Feralas={6950.0748,4633.3002},
  Moonglade={2308.3596,1539.5720}, Mulgore={5137.5557,3424.9756}, Ogrimmar={1402.6192,935.4097},
  Silithus={3483.3717,2322.9009}, StonetalonMountains={4883.3861,3256.2269}, Tanaris={6900.0754,4599.9672},
  Teldrassil={5091.7202,3393.7257}, TheExodar={1056.7829,704.6828}, ThousandNeedles={4400.0469,2933.3120},
  ThunderBluff={1043.7612,695.8286}, UngoroCrater={3700.0400,2466.6489}, Winterspring={7100.0767,4733.2994},

  Alterac={2799.9995,1866.6742}, Arathi={3599.9995,2400.0093}, Badlands={2487.5006,1658.3403},
  BlastedLands={3349.9994,2233.3425}, BurningSteppes={2929.1670,1952.0910}, DeadwindPass={2499.9993,1666.6737},
  DunMorogh={4925.0010,3283.3462}, Duskwood={2699.9995,1800.0074}, EasternPlaguelands={4031.2487,2687.5103},
  Elwynn={3470.8328,2314.5925}, EversongWoods={4925.0027,3283.3461}, Ghostlands={3300.0019,2200.0086},
  Hilsbrad={3199.9990,2133.3416}, Hinterlands={3849.9993,2566.6767}, Ironforge={790.6252,527.6066},
  LochModan={2758.3331,1839.5894}, Redridge={2170.8330,1447.9218}, SearingGorge={2231.2497,1487.5053},
  SilvermoonCity={1211.4593,806.7737}, Silverpine={4199.9991,2800.0111}, Stormwind={1737.5006,1158.3377},
  Stranglethorn={6381.2478,4254.1831}, Sunwell={3327.0810,2218.7578}, SwampOfSorrows={2293.7507,1529.1736},
  Tirisfal={4518.7479,3012.5123}, Undercity={959.3745,640.1066}, WesternPlaguelands={4299.9997,2866.6779},
  Westfall={3499.9997,2333.3425}, Wetlands={4135.4161,2756.2609},

  BladesEdgeMountains={5424.9714,3616.5535}, Hellfire={5164.5562,3443.6423}, Nagrand={5524.9711,3683.2184},
  Netherstorm={5574.9705,3716.5507}, ShadowmoonValley={5499.9711,3666.5518}, ShattrathCity={1306.2431,870.8062},
  TerokkarForest={5399.9719,3599.8875}, Zangarmarsh={5027.0572,3351.9787},

  BoreanTundra={5764.5823,3843.7650}, CrystalsongForest={2722.9165,1814.5903}, Dalaran={830.0149,553.3419},
  Dragonblight={5608.3324,3739.5981}, GrizzlyHills={5249.9987,3500.0137}, HrothgarsLanding={3677.0826,2452.0937},
  HowlingFjord={6045.8318,4031.2655}, IcecrownGlacier={6270.8330,4181.2665}, LakeWintergrasp={2974.9995,1983.3411},
  SholazarBasin={4356.2495,2904.1781}, TheStormPeaks={7112.4982,4741.6847}, ZulDrak={4993.7491,3329.1798},
}

AG.MinimapDiameterYards = {
  outdoor = {[0]=466.6667,[1]=400,[2]=333.3333,[3]=266.3333,[4]=200,[5]=133.3333},
  indoor  = {[0]=300,[1]=240,[2]=180,[3]=120,[4]=80,[5]=50},
}

function AG:GetZoneKey()if WorldMapFrame and WorldMapFrame:IsShown()then return self._playerZoneKey end;SetMapToCurrentZone();local k=GetMapInfo();if k then self._playerZoneKey=k end;return k end
function AG:GetPlayerPosition()if WorldMapFrame and WorldMapFrame:IsShown()then if self._playerZoneKey and self._playerX and self._playerY then return self._playerZoneKey,self._playerX,self._playerY end;return nil end;SetMapToCurrentZone();local k=GetMapInfo();local x,y=GetPlayerMapPosition("player");if not k or not x or not y or(x==0 and y==0)then return nil end;self._playerZoneKey=k;self._playerX=x;self._playerY=y;self._playerStaticZoneID=self:GetPlayerStaticZoneID(k);return k,x,y end
function AG:RefreshPlayerPositionCache()if WorldMapFrame and WorldMapFrame:IsShown()then return self._playerZoneKey,self._playerX,self._playerY end;return self:GetPlayerPosition()end
