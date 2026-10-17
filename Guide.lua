local AG=AleeGather

AG.GuideData = {
  Mining = {
    {
      min=1,max=64,nodes={201},
      zonesEN="Elwynn Forest, Dun Morogh, Durotar, Mulgore, Tirisfal Glades, Darkshore",
      zonesES="Bosque de Elwynn, Dun Morogh, Durotar, Mulgore, Claros de Tirisfal, Costa Oscura",
      zonesCN="艾尔文森林、丹莫罗、杜隆塔尔、莫高雷、提瑞斯法林地、黑海岸",
      routes={
        {
          labelEN="Durotar", labelES="Durotar", labelCN="杜隆塔尔",
          captionEN="After you pass Razor Hill, go inside the cave marked on the map before you jump down!",
          captionES="Después de pasar por Cerrotajo, entra a la cueva marcada en el mapa antes de bajar.",
          captionCN="过了剃刀岭之后，先进入地图上标记的洞穴再跳下去！",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_1_65_Durotar.tga",
        },
        {
          labelEN="Elwynn", labelES="Elwynn", labelCN="艾尔文",
          captionEN="Low level players should skip both caves.",
          captionES="Los jugadores de nivel bajo deberían evitar ambas cuevas.",
          captionCN="低级玩家建议避开两个洞穴。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_1_65_Elwynn.tga",
        },
      },
    },
    {
      min=65,max=124,nodes={202,204,201},
      zonesEN="Hillsbrad Foothills, Redridge Mountains, Ashenvale, The Barrens",
      zonesES="Laderas de Trabalomas, Montañas Crestagrana, Vallefresno, Los Baldíos",
      zonesCN="希尔斯布莱德丘陵、赤脊山、灰谷、贫瘠之地",
      routes={
        {labelEN="Hillsbrad", labelES="Trabalomas", labelCN="希尔斯布莱德", captionEN="Tin, Silver and Copper route in Hillsbrad Foothills.", captionES="Ruta de estaño, plata y cobre en Laderas de Trabalomas.", captionCN="希尔斯布莱德丘陵的锡、银、铜矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Hillsbrad.tga"},
        {labelEN="Redridge", labelES="Crestagrana", labelCN="赤脊山", captionEN="Efficient mining loop in Redridge Mountains.", captionES="Ruta eficiente de minería en Montañas Crestagrana.", captionCN="赤脊山高效采矿环线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Redridge.tga"},
        {labelEN="Ashenvale", labelES="Vallefresno", labelCN="灰谷", captionEN="Alternative route in Ashenvale.", captionES="Ruta alternativa en Vallefresno.", captionCN="灰谷备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Ashenvale.tga"},
        {labelEN="Barrens", labelES="Baldíos", labelCN="贫瘠之地", captionEN="Alternative route in The Barrens.", captionES="Ruta alternativa en Los Baldíos.", captionCN="贫瘠之地备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Barrens.tga"},
      },
    },
    {
      min=125,max=174,nodes={203,205},
      zonesEN="Arathi Highlands, Desolace, Thousand Needles",
      zonesES="Tierras Altas de Arathi, Desolace, Las Mil Agujas",
      zonesCN="阿拉希高地、凄凉之地、千针石林",
      routes={
        {labelEN="Arathi", labelES="Arathi", labelCN="阿拉希", captionEN="Iron route in Arathi Highlands.", captionES="Ruta de hierro en Tierras Altas de Arathi.", captionCN="阿拉希高地铁矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_Arathi.tga"},
        {labelEN="Desolace", labelES="Desolace", labelCN="凄凉之地", captionEN="Alternative route in Desolace.", captionES="Ruta alternativa en Desolace.", captionCN="凄凉之地备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_Desolace.tga"},
        {labelEN="1K Needles", labelES="Mil Agujas", labelCN="千针石林", captionEN="Alternative route in Thousand Needles.", captionES="Ruta alternativa en Las Mil Agujas.", captionCN="千针石林备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_ThousandNeedles.tga"},
      },
    },
    {
      min=175,max=244,nodes={206,208},
      zonesEN="The Hinterlands, Tanaris",
      zonesES="Tierras del Interior, Tanaris",
      zonesCN="辛特兰、塔纳利斯",
      routes={
        {labelEN="Hinterlands", labelES="Tierras Int.", labelCN="辛特兰", captionEN="Mithril route in The Hinterlands.", captionES="Ruta de mitril en Tierras del Interior.", captionCN="辛特兰秘银矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_175_244_Hinterlands.tga"},
        {labelEN="Tanaris", labelES="Tanaris", labelCN="塔纳利斯", captionEN="Alternative route in Tanaris.", captionES="Ruta alternativa en Tanaris.", captionCN="塔纳利斯备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_175_244_Tanaris.tga"},
      },
    },
    {
      min=245,max=274,nodes={214,206,208},
      zonesEN="Un'Goro Crater, Blasted Lands, Felwood",
      zonesES="Cráter de Un'Goro, Las Tierras Devastadas, Frondavil",
      zonesCN="安戈洛环形山、诅咒之地、费伍德森林",
      routes={
        {labelEN="Un'Goro", labelES="Un'Goro", labelCN="安戈洛", captionEN="Small Thorium route in Un'Goro Crater.", captionES="Ruta de torio pequeño en el Cráter de Un'Goro.", captionCN="安戈洛环形山瑟银矿脉路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_UnGoroSmall.tga"},
        {labelEN="Blasted", labelES="Devastadas", labelCN="诅咒之地", captionEN="Alternative route in Blasted Lands.", captionES="Ruta alternativa en Las Tierras Devastadas.", captionCN="诅咒之地备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_BlastedLands.tga"},
        {labelEN="Felwood", labelES="Frondavil", labelCN="费伍德", captionEN="Alternative route in Felwood.", captionES="Ruta alternativa en Frondavil.", captionCN="费伍德森林备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_Felwood.tga"},
      },
    },
    {
      min=275,max=299,nodes={215,214},
      zonesEN="Un'Goro Crater, Eastern Plaguelands, Winterspring, Burning Steppes",
      zonesES="Cráter de Un'Goro, Tierras de la Peste del Este, Cuna del Invierno, Estepas Ardientes",
      zonesCN="安戈洛环形山、东瘟疫之地、冬泉谷、燃烧平原",
      routes={
        {labelEN="Un'Goro Rich", labelES="Un'Goro Rico", labelCN="安戈洛富矿", captionEN="Rich Thorium route in Un'Goro Crater.", captionES="Ruta de torio rico en el Cráter de Un'Goro.", captionCN="安戈洛环形山富瑟银矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_UnGoroRich.tga"},
        {labelEN="E. Plague", labelES="Peste Este", labelCN="东瘟疫", captionEN="Alternative route in Eastern Plaguelands.", captionES="Ruta alternativa en Tierras de la Peste del Este.", captionCN="东瘟疫之地备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_EasternPlaguelands.tga"},
        {labelEN="Winterspring", labelES="Invierno", labelCN="冬泉谷", captionEN="Alternative route in Winterspring.", captionES="Ruta alternativa en Cuna del Invierno.", captionCN="冬泉谷备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_Winterspring.tga"},
        {labelEN="Burning", labelES="Ardientes", labelCN="燃烧平原", captionEN="Alternative route in Burning Steppes.", captionES="Ruta alternativa en Estepas Ardientes.", captionCN="燃烧平原备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_BurningSteppes.tga"},
      },
    },
    {
      min=300,max=324,nodes={221},
      zonesEN="Hellfire Peninsula",
      zonesES="Península del Fuego Infernal",
      zonesCN="地狱火半岛",
      routes={
        {labelEN="Hellfire 1", labelES="Hellfire 1", labelCN="地狱火 1", captionEN="Fel Iron route in Hellfire Peninsula.", captionES="Ruta de hierro vil en Península del Fuego Infernal.", captionCN="地狱火半岛魔铁矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_300_324_Hellfire1.tga"},
        {labelEN="Hellfire 2", labelES="Hellfire 2", labelCN="地狱火 2", captionEN="Alternative Hellfire Peninsula route.", captionES="Ruta alternativa en Península del Fuego Infernal.", captionCN="地狱火半岛备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_300_324_Hellfire2.tga"},
      },
    },
    {
      min=325,max=349,nodes={222},
      zonesEN="Zangarmarsh, Terokkar Forest",
      zonesES="Marisma de Zangar, Bosque de Terokkar",
      zonesCN="赞加沼泽、泰罗卡森林",
      routes={
        {labelEN="Zangar", labelES="Zangar", labelCN="赞加", captionEN="Adamantite route in Zangarmarsh.", captionES="Ruta de adamantita en Marisma de Zangar.", captionCN="赞加沼泽精金矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Zangarmarsh.tga"},
        {labelEN="Terokkar 1", labelES="Terokkar 1", labelCN="泰罗卡 1", captionEN="Alternative Terokkar Forest route.", captionES="Ruta alternativa en Bosque de Terokkar.", captionCN="泰罗卡森林备选路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Terrokar1.tga"},
        {labelEN="Terokkar 2", labelES="Terokkar 2", labelCN="泰罗卡 2", captionEN="Second Terokkar Forest route.", captionES="Segunda ruta en Bosque de Terokkar.", captionCN="泰罗卡森林第二条路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Terrokar2.tga"},
      },
    },
    {
      min=350,max=399,nodes={228,229},
      zonesEN="Borean Tundra, Howling Fjord",
      zonesES="Tundra Boreal, Fiordo Aquilonal",
      zonesCN="北风苔原、嚎风峡湾",
      routes={
        {labelEN="Borean", labelES="Boreal", labelCN="苔原", captionEN="Cobalt route in Borean Tundra.", captionES="Ruta de cobalto en Tundra Boreal.", captionCN="北风苔原钴矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_BoreanTundra.tga"},
        {labelEN="Borean NF", labelES="Boreal SF", labelCN="苔原（无飞行）", captionEN="Borean Tundra route without flying.", captionES="Ruta en Tundra Boreal sin montura voladora.", captionCN="北风苔原无飞行坐骑路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_BoreanTundra_NoFlying.tga"},
        {labelEN="Howling", labelES="Aquilonal", labelCN="峡湾", captionEN="Cobalt route in Howling Fjord.", captionES="Ruta de cobalto en Fiordo Aquilonal.", captionCN="嚎风峡湾钴矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_HowlingFjord.tga"},
        {labelEN="Howling NF", labelES="Aquilonal SF", labelCN="峡湾（无飞行）", captionEN="Howling Fjord route without flying.", captionES="Ruta en Fiordo Aquilonal sin montura voladora.", captionCN="嚎风峡湾无飞行坐骑路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_HowlingFjord_NoFlying.tga"},
      },
    },
    {
      min=400,max=450,nodes={231,232,230},
      zonesEN="Sholazar Basin, The Storm Peaks",
      zonesES="Cuenca de Sholazar, Las Cumbres Tormentosas",
      zonesCN="索拉查盆地、风暴峭壁",
      routes={
        {labelEN="Sholazar", labelES="Sholazar", labelCN="索拉查", captionEN="Saronite route in Sholazar Basin.", captionES="Ruta de saronita en Cuenca de Sholazar.", captionCN="索拉查盆地萨隆邪铁矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_400_450_Sholazar.tga"},
        {labelEN="Storm Peaks", labelES="Tormentosas", labelCN="风暴峭壁", captionEN="Saronite and Titanium route in The Storm Peaks.", captionES="Ruta de saronita y titanio en Las Cumbres Tormentosas.", captionCN="风暴峭壁萨隆邪铁矿与泰坦神铁矿路线。", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_400_450_StormPeaks.tga"},
      },
    },
  },
  ["Herb Gathering"] = {
    {
      min=1,max=69,nodes={401,402,403},
      zonesEN="Any starter zone",
      zonesES="Cualquier zona inicial",
      zonesCN="任意新手区域",
      routes={
        {
          labelEN="Durotar", labelES="Durotar", labelCN="杜隆塔尔",
          captionEN="Herbalism route in Durotar.",
          captionES="Ruta de herboristería en Durotar.",
          captionCN="杜隆塔尔草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Durotar.tga",
        },
        {
          labelEN="Elwynn", labelES="Elwynn", labelCN="艾尔文",
          captionEN="Herbalism route in Elwynn.",
          captionES="Ruta de herboristería en Elwynn.",
          captionCN="艾尔文森林草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Elwynn.tga",
        },
        {
          labelEN="Dun Morogh", labelES="Dun Morogh", labelCN="丹莫罗",
          captionEN="Herbalism route in Dun Morogh.",
          captionES="Ruta de herboristería en Dun Morogh.",
          captionCN="丹莫罗草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_DunMorogh.tga",
        },
        {
          labelEN="Mulgore", labelES="Mulgore", labelCN="莫高雷",
          captionEN="Herbalism route in Mulgore.",
          captionES="Ruta de herboristería en Mulgore.",
          captionCN="莫高雷草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Mulgore.tga",
        },
        {
          labelEN="Teldrassil", labelES="Teldrassil", labelCN="泰达希尔",
          captionEN="Herbalism route in Teldrassil.",
          captionES="Ruta de herboristería en Teldrassil.",
          captionCN="泰达希尔草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Teldrassil.tga",
        },
        {
          labelEN="Tirisfal", labelES="Tirisfal", labelCN="提瑞斯法",
          captionEN="Herbalism route in Tirisfal.",
          captionES="Ruta de herboristería en Tirisfal.",
          captionCN="提瑞斯法林地草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Tirisfal.tga",
        },
      },
    },
    {
      min=70,max=114,nodes={404,407,408},
      zonesEN="The Barrens, Silverpine Forest, Loch Modan, Darkshore",
      zonesES="Los Baldíos, Bosque de Argénteos, Loch Modan, Costa Oscura",
      zonesCN="贫瘠之地、银松森林、洛克莫丹、黑海岸",
      routes={
        {
          labelEN="Barrens", labelES="Los Baldíos", labelCN="贫瘠之地",
          captionEN="Herbalism route in Barrens.",
          captionES="Ruta de herboristería en Los Baldíos.",
          captionCN="贫瘠之地草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Barrens.tga",
        },
        {
          labelEN="Silverpine", labelES="Bosque de Argénteos", labelCN="银松森林",
          captionEN="Herbalism route in Silverpine.",
          captionES="Ruta de herboristería en Bosque de Argénteos.",
          captionCN="银松森林草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Silverpine.tga",
        },
        {
          labelEN="Loch Modan", labelES="Loch Modan", labelCN="洛克莫丹",
          captionEN="Herbalism route in Loch Modan.",
          captionES="Ruta de herboristería en Loch Modan.",
          captionCN="洛克莫丹草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_LochModan.tga",
        },
        {
          labelEN="Darkshore", labelES="Costa Oscura", labelCN="黑海岸",
          captionEN="Herbalism route in Darkshore.",
          captionES="Ruta de herboristería en Costa Oscura.",
          captionCN="黑海岸草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Darkshore.tga",
        },
      },
    },
    {
      min=115,max=169,nodes={409,410,408,411,412},
      zonesEN="Hillsbrad Foothills, Wetlands, Stonetalon Mountains",
      zonesES="Laderas de Trabalomas, Los Humedales, Sierra Espolón",
      zonesCN="希尔斯布莱德丘陵、湿地、石爪山脉",
      routes={
        {
          labelEN="Hillsbrad", labelES="Trabalomas", labelCN="希尔斯布莱德",
          captionEN="Herbalism route in Hillsbrad.",
          captionES="Ruta de herboristería en Trabalomas.",
          captionCN="希尔斯布莱德丘陵草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Hillsbrad.tga",
        },
        {
          labelEN="Wetlands", labelES="Los Humedales", labelCN="湿地",
          captionEN="Herbalism route in Wetlands.",
          captionES="Ruta de herboristería en Los Humedales.",
          captionCN="湿地草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Wetlands.tga",
        },
        {
          labelEN="Stonetalon", labelES="Sierra Espolón", labelCN="石爪山",
          captionEN="Herbalism route in Stonetalon.",
          captionES="Ruta de herboristería en Sierra Espolón.",
          captionCN="石爪山脉草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Stonetalon.tga",
        },
      },
    },
    {
      min=170,max=204,nodes={411,412,413,414,415},
      zonesEN="Stranglethorn Vale, Arathi Highlands",
      zonesES="Vega de Tuercespina, Tierras Altas de Arathi",
      zonesCN="荆棘谷、阿拉希高地",
      routes={
        {
          labelEN="Stranglethorn", labelES="Tuercespina", labelCN="荆棘谷",
          captionEN="Herbalism route in Stranglethorn.",
          captionES="Ruta de herboristería en Tuercespina.",
          captionCN="荆棘谷草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_170_204_STV.tga",
        },
        {
          labelEN="Arathi", labelES="Arathi", labelCN="阿拉希",
          captionEN="Herbalism route in Arathi.",
          captionES="Ruta de herboristería en Arathi.",
          captionCN="阿拉希高地草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_170_204_Arathi.tga",
        },
      },
    },
    {
      min=205,max=229,nodes={417,418},
      zonesEN="Tanaris, Searing Gorge",
      zonesES="Tanaris, La Garganta de Fuego",
      zonesCN="塔纳利斯、灼热峡谷",
      routes={
        {
          labelEN="Tanaris", labelES="Tanaris", labelCN="塔纳利斯",
          captionEN="Herbalism route in Tanaris.",
          captionES="Ruta de herboristería en Tanaris.",
          captionCN="塔纳利斯草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_205_229_Tanaris.tga",
        },
        {
          labelEN="Searing Gorge", labelES="Garganta de Fuego", labelCN="灼热峡谷",
          captionEN="Herbalism route in Searing Gorge.",
          captionES="Ruta de herboristería en Garganta de Fuego.",
          captionCN="灼热峡谷草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_205_229_SearingGorge.tga",
        },
      },
    },
    {
      min=230,max=269,nodes={421,422,423,424,425},
      zonesEN="Feralas, The Hinterlands",
      zonesES="Feralas, Tierras del Interior",
      zonesCN="菲拉斯、辛特兰",
      routes={
        {
          labelEN="Hinterlands", labelES="Tierras del Interior", labelCN="辛特兰",
          captionEN="Herbalism route in Hinterlands.",
          captionES="Ruta de herboristería en Tierras del Interior.",
          captionCN="辛特兰草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_230_269_Hinterlands.tga",
        },
      },
    },
    {
      min=270,max=299,nodes={426,427,428,429},
      zonesEN="Felwood, Western Plaguelands, Eastern Plaguelands",
      zonesES="Frondavil, Tierras de la Peste del Oeste, Tierras de la Peste del Este",
      zonesCN="费伍德森林、西瘟疫之地、东瘟疫之地",
      routes={
        {
          labelEN="Felwood", labelES="Frondavil", labelCN="费伍德",
          captionEN="Herbalism route in Felwood.",
          captionES="Ruta de herboristería en Frondavil.",
          captionCN="费伍德森林草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_270_299_Felwood.tga",
        },
      },
    },
    {
      min=300,max=349,nodes={431,432,433,434,435},
      zonesEN="Hellfire Peninsula, Terokkar Forest, Nagrand, Blade's Edge Mountains, Netherstorm",
      zonesES="Península del Fuego Infernal, Bosque de Terokkar, Nagrand, Montañas Filospada, Tormenta Abisal",
      zonesCN="地狱火半岛、泰罗卡森林、纳格兰、刀锋山、虚空风暴",
      routes={
        {
          labelEN="Hellfire", labelES="Fuego Infernal", labelCN="地狱火",
          captionEN="Herbalism route in Hellfire.",
          captionES="Ruta de herboristería en Fuego Infernal.",
          captionCN="地狱火半岛草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Hellfire.tga",
        },
        {
          labelEN="Terokkar", labelES="Terokkar", labelCN="泰罗卡",
          captionEN="Herbalism route in Terokkar.",
          captionES="Ruta de herboristería en Terokkar.",
          captionCN="泰罗卡森林草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Terokkar.tga",
        },
        {
          labelEN="Nagrand", labelES="Nagrand", labelCN="纳格兰",
          captionEN="Herbalism route in Nagrand.",
          captionES="Ruta de herboristería en Nagrand.",
          captionCN="纳格兰草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Nagrand.tga",
        },
        {
          labelEN="Blade's Edge", labelES="Montañas Filospada", labelCN="刀锋山",
          captionEN="Herbalism route in Blade's Edge.",
          captionES="Ruta de herboristería en Montañas Filospada.",
          captionCN="刀锋山草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_BladesEdge.tga",
        },
        {
          labelEN="Netherstorm", labelES="Tormenta Abisal", labelCN="虚空风暴",
          captionEN="Herbalism route in Netherstorm.",
          captionES="Ruta de herboristería en Tormenta Abisal.",
          captionCN="虚空风暴草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Netherstorm.tga",
        },
      },
    },
    {
      min=350,max=399,nodes={438,440,441,450},
      zonesEN="Borean Tundra, Howling Fjord, Grizzly Hills",
      zonesES="Tundra Boreal, Fiordo Aquilonal, Colinas Pardas",
      zonesCN="北风苔原、嚎风峡湾、灰熊丘陵",
      routes={
        {
          labelEN="Borean Tundra", labelES="Tundra Boreal", labelCN="北风苔原",
          captionEN="Herbalism route in Borean Tundra.",
          captionES="Ruta de herboristería en Tundra Boreal.",
          captionCN="北风苔原草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_Borean.tga",
        },
        {
          labelEN="Howling Fjord", labelES="Fiordo Aquilonal", labelCN="嚎风峡湾",
          captionEN="Herbalism route in Howling Fjord.",
          captionES="Ruta de herboristería en Fiordo Aquilonal.",
          captionCN="嚎风峡湾草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_HowlingFjord.tga",
        },
        {
          labelEN="Grizzly Hills", labelES="Colinas Pardas", labelCN="灰熊丘陵",
          captionEN="Herbalism route in Grizzly Hills.",
          captionES="Ruta de herboristería en Colinas Pardas.",
          captionCN="灰熊丘陵草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_GrizzlyHills.tga",
        },
      },
    },
    {
      min=400,max=434,nodes={442,443,451},
      zonesEN="Sholazar Basin, Zul'Drak",
      zonesES="Cuenca de Sholazar, Zul'Drak",
      zonesCN="索拉查盆地、祖达克",
      routes={
        {
          labelEN="Sholazar 1", labelES="Sholazar 1", labelCN="索拉查 1",
          captionEN="Herbalism route in Sholazar 1.",
          captionES="Ruta de herboristería en Sholazar 1.",
          captionCN="索拉查盆地草药学路线一。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_400_434_Sholazar1.tga",
        },
        {
          labelEN="Sholazar 2", labelES="Sholazar 2", labelCN="索拉查 2",
          captionEN="Herbalism route in Sholazar 2.",
          captionES="Ruta de herboristería en Sholazar 2.",
          captionCN="索拉查盆地草药学路线二。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_400_434_Sholazar2.tga",
        },
      },
    },
    {
      min=435,max=450,nodes={447,448},
      zonesEN="The Storm Peaks, Icecrown",
      zonesES="Las Cumbres Tormentosas, Corona de Hielo",
      zonesCN="风暴峭壁、冰冠冰川",
      routes={
        {
          labelEN="Storm Peaks", labelES="Cumbres Tormentosas", labelCN="风暴峭壁",
          captionEN="Herbalism route in Storm Peaks.",
          captionES="Ruta de herboristería en Cumbres Tormentosas.",
          captionCN="风暴峭壁草药学路线。",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_435_450_StormPeaks.tga",
        },
      },
    },
  },
  Skinning = {
    {
      min=1,max=74,nodes={},
      nodesTextEN="Boars, scorpids, wolves, bears and other starter beasts",
      nodesTextES="Jabalíes, escórpidos, lobos, osos y otras bestias iniciales",
      nodesTextCN="野猪、蝎子、狼、熊和其他新手野兽",
      zonesEN="Durotar, Dun Morogh",
      zonesES="Durotar, Dun Morogh",
      zonesCN="杜隆塔尔、丹莫罗",
      routes={
{
  labelEN="Durotar", labelES="Durotar", labelCN="杜隆塔尔",
  captionEN="Kill and skin boars, scorpids and other low-level beasts while moving from Sen'jin Village toward Orgrimmar.",
  captionES="Mata y desuella jabalíes, escórpidos y otras bestias de bajo nivel mientras avanzas desde Sen'jin hacia Orgrimmar.",
  captionCN="从森金村向奥格瑞玛推进，沿途击杀并剥取野猪、蝎子等低级野兽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_1_75_Durotar.tga",
},{
  labelEN="Dun Morogh", labelES="Dun Morogh", labelCN="丹莫罗",
  captionEN="Make circles around the lake near Ironforge and skin boars, wolves, bears and other nearby beasts.",
  captionES="Da vueltas alrededor del lago cerca de Forjaz y desuella jabalíes, lobos, osos y otras bestias cercanas.",
  captionCN="绕铁炉堡附近的湖转圈，剥取野猪、狼、熊等附近野兽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_1_75_DunMorogh.tga",
},      },
    },
    {
      min=75,max=164,nodes={},
      nodesTextEN="Zhevras, plainstriders, lions, crocolisks, spiders and raptors",
      nodesTextES="Zhevras, acechadores de llanura, leones, crocoliscos, arañas y raptores",
      nodesTextCN="斑马、陆行鸟、狮子、鳄鱼、蜘蛛和迅猛龙",
      zonesEN="The Barrens, Loch Modan, Wetlands",
      zonesES="Los Baldíos, Loch Modan, Los Humedales",
      zonesCN="贫瘠之地、洛克莫丹、湿地",
      routes={
{
  labelEN="Barrens", labelES="Baldíos", labelCN="贫瘠之地",
  captionEN="Skin zhevras, plainstriders, lions and other beasts on the road toward Camp Taurajo.",
  captionES="Desuella zhevras, acechadores de llanura, leones y otras bestias en el camino hacia Camp Taurajo.",
  captionCN="在通往陶拉祖营地的路上剥取斑马、陆行鸟、狮子等野兽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_Barrens.tga",
},{
  labelEN="Loch Modan", labelES="Loch Modan", labelCN="洛克莫丹",
  captionEN="Follow the route and skin bears, boars, spiders and other beasts around Loch Modan.",
  captionES="Sigue la ruta y desuella osos, jabalíes, arañas y otras bestias alrededor de Loch Modan.",
  captionCN="沿路线行进，剥取洛克莫丹周围的熊、野猪、蜘蛛等野兽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_LochModan.tga",
},{
  labelEN="Wetlands", labelES="Los Humedales", labelCN="湿地",
  captionEN="Follow the river and skin crocolisks, raptors and spiders on the way to Menethil Harbor.",
  captionES="Sigue el río y desuella crocoliscos, raptores y arañas camino a Menethil.",
  captionCN="沿河前往米奈希尔港，沿途剥取鳄鱼、迅猛龙和蜘蛛的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_Wetlands.tga",
},      },
    },
    {
      min=165,max=204,nodes={},
      nodesTextEN="Hyenas, cougars and raptors",
      nodesTextES="Hienas, pumas y raptores",
      nodesTextCN="土狼、山狮和迅猛龙",
      zonesEN="Thousand Needles, Arathi Highlands",
      zonesES="Mil Agujas, Tierras Altas de Arathi",
      zonesCN="千针石林、阿拉希高地",
      routes={
{
  labelEN="Thousand Needles", labelES="Mil Agujas", labelCN="千针石林",
  captionEN="Skin hyenas, cougars and then the higher-level raptors in the marked orange section.",
  captionES="Desuella hienas, pumas y luego los raptores de mayor nivel en la zona naranja marcada.",
  captionCN="先剥土狼、山狮，再剥标记橙色区域内更高等级的迅猛龙。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_165_205_ThousandNeedles.tga",
},{
  labelEN="Arathi", labelES="Arathi", labelCN="阿拉希",
  captionEN="Focus mainly on the raptors in Arathi Highlands, especially the higher-level packs in the southeast.",
  captionES="Concéntrate sobre todo en los raptores de Arathi, especialmente en los grupos de mayor nivel del sureste.",
  captionCN="主要目标是阿拉希高地的迅猛龙，尤其是东南部的高等级兽群。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_165_205_Arathi.tga",
},      },
    },
    {
      min=205,max=299,nodes={},
      nodesTextEN="Yetis, hippogryphs, dinosaurs and other high-level beasts",
      nodesTextES="Yetis, hipogrifos, dinosaurios y otras bestias de mayor nivel",
      nodesTextCN="雪人、角鹰兽、恐龙和其他高等级野兽",
      zonesEN="Feralas, Un'Goro Crater",
      zonesES="Feralas, Cráter de Un'Goro",
      zonesCN="菲拉斯、安戈洛环形山",
      routes={
{
  labelEN="Feralas", labelES="Feralas", labelCN="菲拉斯",
  captionEN="Start around Camp Mojache, then move to the Yeti cave; Hippogryphs are a good backup if the cave is crowded.",
  captionES="Comienza alrededor de Camp Mojache y luego ve a la cueva de yetis; los hipogrifos son buen respaldo si la cueva está ocupada.",
  captionCN="从莫沙彻营地附近开始，然后前往雪人洞；洞里人多时角鹰兽是很好的备选。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_205_300_Feralas.tga",
},{
  labelEN="Un'Goro", labelES="Un'Goro", labelCN="安戈洛",
  captionEN="Skin dinosaurs, pterrordaxes and other beasts all around Un'Goro Crater.",
  captionES="Desuella dinosaurios, pterrordáctilos y otras bestias por todo el Cráter de Un'Goro.",
  captionCN="在安戈洛环形山各处剥取恐龙、翼手龙等野兽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_205_300_UnGoro.tga",
},      },
    },
    {
      min=300,max=349,nodes={},
      nodesTextEN="Helboars, Ravagers, Talbuks and Clefthoofs",
      nodesTextES="Jabalíes viles, devastadores, talbuks y uñagrietas",
      nodesTextCN="地狱野猪、掠食者、塔布羊和裂蹄牛",
      zonesEN="Hellfire Peninsula, Nagrand",
      zonesES="Península del Fuego Infernal, Nagrand",
      zonesCN="地狱火半岛、纳格兰",
      routes={
{
  labelEN="Hellfire", labelES="Fuego Infernal", labelCN="地狱火",
  captionEN="Start with Starving Helboars, then Deranged Helboars, and later Razorfang Hatchlings and Ravagers.",
  captionES="Comienza con los jabalíes viles hambrientos, luego los trastornados y después crías y devastadores colmiferoces.",
  captionCN="先杀饥饿的地狱野猪，再杀疯狂的地狱野猪，之后是刃牙幼崽和掠食者。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_300_350_Hellfire.tga",
},{
  labelEN="Nagrand", labelES="Nagrand", labelCN="纳格兰",
  captionEN="Kill and skin Talbuks and Clefthoofs around the marked area.",
  captionES="Mata y desuella talbuks y uñagrietas en la zona marcada.",
  captionCN="在标记区域击杀并剥取塔布羊和裂蹄牛的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_300_350_Nagrand.tga",
},      },
    },
    {
      min=350,max=394,nodes={},
      nodesTextEN="Wooly Rhino Matriarchs and Wooly Rhino Calves",
      nodesTextES="Matriarcas de rinoceronte lanudo y crías",
      nodesTextCN="长毛犀牛族长和幼崽",
      zonesEN="Borean Tundra",
      zonesES="Tundra Boreal",
      zonesCN="北风苔原",
      routes={
{
  labelEN="Borean Tundra", labelES="Tundra Boreal", labelCN="北风苔原",
  captionEN="Skin Wooly Rhino Matriarchs and Wooly Rhino Calves north and south of Warsong Hold.",
  captionES="Desuella matriarcas de rinoceronte lanudo y crías al norte y sur del Bastión Grito de Guerra.",
  captionCN="在战歌要塞南北两侧剥取长毛犀牛族长和幼崽的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_350_395_BoreanTundra.tga",
},      },
    },
    {
      min=395,max=450,nodes={},
      nodesTextEN="Hardknuckle Foragers and Hardknuckle Chargers",
      nodesTextES="Recolectores y cargadores Nudillos Duros",
      nodesTextCN="硬拳收割者和硬拳冲锋者",
      zonesEN="Sholazar Basin",
      zonesES="Cuenca de Sholazar",
      zonesCN="索拉查盆地",
      routes={
{
  labelEN="Sholazar Basin", labelES="Sholazar", labelCN="索拉查盆地",
  captionEN="Skin Hardknuckle Foragers and Hardknuckle Chargers around Frenzyheart Hill.",
  captionES="Desuella recolectores y cargadores Nudillos Duros alrededor de la Colina Corazón Frenético.",
  captionCN="在狂心岭周围剥取硬拳收割者和硬拳冲锋者的皮。",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_395_450_Sholazar.tga",
},      },
    },
  },
}

local function isSpanish(lang)
  return lang=="esES" or lang=="esMX"
end

local function isChinese(lang)
  return lang=="zhCN" or lang=="zhTW"
end

local function tChoice(lang,en,es)
  if isSpanish(lang) then return es end
  return en
end

local function tChoiceCN(lang,en,es,cn)
  if isChinese(lang) and cn then return cn end
  if isSpanish(lang) then return es end
  return en
end

local function getStagesForCurrentProfession()
  local mining=AG:GetProfessionInfo("Mining")
  local herb=AG:GetProfessionInfo("Herb Gathering")
  local skin=AG:GetProfessionInfo("Skinning")
  if mining then return "Mining",mining.rank or 0 end
  if herb then return "Herb Gathering",herb.rank or 0 end
  if skin then return "Skinning",skin.rank or 0 end
  return nil,0
end

local function nodeList(ids)
  local out={}
  for _,id in ipairs(ids or {}) do
    local node = AG.Nodes[id]
    if node then
      local name = AG:GetNodeName(id)
      local skill = tonumber(node.skill or 0) or 0
      if skill > 0 then
        table.insert(out, string.format("%s (%d)", name, skill))
      else
        table.insert(out, name)
      end
    end
  end
  return table.concat(out,", ")
end

function AG:GetGuideStage(category,skill)
  local data=self.GuideData[category]
  if not data then return nil end
  for _,stage in ipairs(data) do
    if skill>=stage.min and skill<=stage.max then return stage end
  end
  return data[#data]
end

function AG:GetGuideStageIndex(category, skill)
  local data=self.GuideData[category]
  if not data then return nil end
  for i,stage in ipairs(data) do
    if skill>=stage.min and skill<=stage.max then return i end
  end
  return #data
end

local function makeRouteButton(parent)
  local b=AG:CreateThemedButton(parent,112,20)
  b:SetScript("OnClick",function(self)
    if AG and AG.SelectGuideRoute then AG:SelectGuideRoute(self.routeIndex or 1) end
  end)
  return b
end

function AG:InitializeGuide()
  local f=CreateFrame("Frame","AleeGatherGuide",UIParent)
  self.guide=f; self:ApplyWindowStyle(f,self.db.profile.guideOpacity or 0.95)
  -- Close with ESC like a native WoW panel.
  UISpecialFrames=UISpecialFrames or {}
  local registered=false
  for _,name in ipairs(UISpecialFrames) do
    if name=="AleeGatherGuide" then registered=true break end
  end
  if not registered then table.insert(UISpecialFrames,"AleeGatherGuide") end
  f:SetWidth(720); f:SetHeight(712); f:SetPoint("CENTER",UIParent,"CENTER",0,0)
  f:SetFrameStrata("DIALOG")
  f:SetAlpha((self.db and self.db.profile and self.db.profile.guideOpacity) or 0.95)
  f:EnableMouse(true); f:SetMovable(true); f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart",function(self) self:StartMoving() end)
  f:SetScript("OnDragStop",function(self) self:StopMovingOrSizing() end)
  f:Hide()

  f.title=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge"); f.title:SetPoint("TOPLEFT",28,-20)
  f.prof=f:CreateFontString(nil,"OVERLAY","GameFontHighlight"); f.prof:SetPoint("TOPLEFT",28,-61); f.prof:SetWidth(672); f.prof:SetJustifyH("LEFT")
  f.range=f:CreateFontString(nil,"OVERLAY","GameFontNormal"); f.range:SetPoint("TOPLEFT",28,-91); f.range:SetWidth(672); f.range:SetJustifyH("LEFT")
  f.nodes=f:CreateFontString(nil,"OVERLAY","GameFontHighlight"); f.nodes:SetPoint("TOPLEFT",28,-119); f.nodes:SetWidth(672); f.nodes:SetJustifyH("LEFT")
  f.zones=f:CreateFontString(nil,"OVERLAY","GameFontHighlight"); f.zones:SetPoint("TOPLEFT",28,-151); f.zones:SetWidth(672); f.zones:SetJustifyH("LEFT"); f.zones:SetJustifyV("TOP")

  f.routeTitle=f:CreateFontString(nil,"OVERLAY","GameFontNormal")
  f.routeTitle:SetPoint("TOPLEFT",28,-216)
  f.routeTitle:SetWidth(672)
  f.routeTitle:SetJustifyH("LEFT")

  f.stageSelected=f:CreateFontString(nil,"OVERLAY","GameFontHighlightLarge")
  f.stageSelected:SetPoint("TOPRIGHT",-116,-92)
  f.stageSelected:SetWidth(120)
  f.stageSelected:SetJustifyH("RIGHT")

  f.prevStage=AG:CreateThemedButton(f,28,20); f.prevStage:SetText("<")
  f.prevStage:SetPoint("TOPRIGHT",-82,-90)
  f.prevStage:SetScript("OnClick",function()
    if not AG.guideCurrentStages or #AG.guideCurrentStages==0 then return end
    local i=(f.stageIndex or 1)-1
    if i<1 then i=#AG.guideCurrentStages end
    AG:SelectGuideStage(i)
  end)

  f.nextStage=AG:CreateThemedButton(f,28,20); f.nextStage:SetText(">")
  f.nextStage:SetPoint("TOPRIGHT",-50,-90)
  f.nextStage:SetScript("OnClick",function()
    if not AG.guideCurrentStages or #AG.guideCurrentStages==0 then return end
    local i=(f.stageIndex or 1)+1
    if i>#AG.guideCurrentStages then i=1 end
    AG:SelectGuideStage(i)
  end)

  f.routeButtons={}
  for i=1,6 do
    local b=makeRouteButton(f)
    local row=math.floor((i-1)/3)
    local col=(i-1)%3
    b:SetPoint("TOPLEFT",28 + (col*128), -246 - (row*27))
    b:Hide()
    f.routeButtons[i]=b
  end

  f.routeCaption=f:CreateFontString(nil,"OVERLAY","GameFontHighlight")
  f.routeCaption:SetPoint("TOPLEFT",28,-307)
  f.routeCaption:SetWidth(672)
  f.routeCaption:SetJustifyH("LEFT")
  f.routeCaption:SetJustifyV("TOP")

  f.routeSelected=f:CreateFontString(nil,"OVERLAY","GameFontNormalLarge")
  f.routeSelected:SetPoint("TOPRIGHT",-68,-216)
  f.routeSelected:SetWidth(260)
  f.routeSelected:SetJustifyH("RIGHT")

  f.prevRoute=AG:CreateThemedButton(f,28,20); f.prevRoute:SetText("<")
  f.prevRoute:SetPoint("TOPRIGHT",-102,-246)
  f.prevRoute:SetScript("OnClick",function()
    if not AG.guideCurrentRoutes or #AG.guideCurrentRoutes==0 then return end
    local i=(f.routeIndex or 1)-1
    if i<1 then i=#AG.guideCurrentRoutes end
    AG:SelectGuideRoute(i)
  end)

  f.nextRoute=AG:CreateThemedButton(f,28,20); f.nextRoute:SetText(">")
  f.nextRoute:SetPoint("TOPRIGHT",-68,-246)
  f.nextRoute:SetScript("OnClick",function()
    if not AG.guideCurrentRoutes or #AG.guideCurrentRoutes==0 then return end
    local i=(f.routeIndex or 1)+1
    if i>#AG.guideCurrentRoutes then i=1 end
    AG:SelectGuideRoute(i)
  end)

  f.imageFrame=CreateFrame("Frame",nil,f)
  f.imageFrame:SetWidth(648); f.imageFrame:SetHeight(304)
  f.imageFrame:SetPoint("TOPLEFT",36,-341)
  f.imageFrame:SetBackdrop({bgFile="Interface\\Tooltips\\UI-Tooltip-Background",edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",tile=true,tileSize=8,edgeSize=12,insets={left=3,right=3,top=3,bottom=3}})
  f.imageFrame:SetBackdropColor(0,0,0,0.85)

  f.image=f.imageFrame:CreateTexture(nil,"ARTWORK")
  f.image:SetWidth(640); f.image:SetHeight(296)
  f.image:SetPoint("CENTER",f.imageFrame,"CENTER",0,0)
  f.image:SetTexCoord(0,1,0,1)

  f.noImage=f:CreateFontString(nil,"OVERLAY","GameFontDisable")
  f.noImage:SetPoint("CENTER",f.imageFrame,"CENTER",0,0)
  f.noImage:SetWidth(600)
  f.noImage:SetJustifyH("CENTER")
  f.noImage:SetJustifyV("MIDDLE")


  f.note=f:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
  f.note:SetPoint("BOTTOMLEFT",30,22)
  f.note:SetWidth(560)
  f.note:SetJustifyH("LEFT")

  f.close=AG:CreateThemedButton(f,100,24); f.close:SetPoint("BOTTOMRIGHT",-30,18)
  f.close:SetScript("OnClick",function() f:Hide() end)
  self:ApplyThemeDetails(f)
end

function AG:SelectGuideStage(index)
  if not self.guide then return end
  self.guide.stageIndex=index or 1
  self.guide.routeIndex=1
  self:RefreshGuide()
end

function AG:SelectGuideRoute(index)
  if not self.guide then return end
  self.guide.routeIndex=index or 1
  self:RefreshGuide()
end

function AG:RefreshGuide()
  if not self.guide then self:InitializeGuide() end
  local category,skill=getStagesForCurrentProfession()
  local f=self.guide
  local lang=self:GetLanguage()

  f.title:SetText("|cff55dd88"..self:L("GUIDE_TITLE").."|r")
  f.close:SetText(self:L("CLOSE"))
  local guideOpacity=(self.db and self.db.profile and self.db.profile.guideOpacity) or 0.95
  f:SetAlpha(guideOpacity)

  if not category then
    f.prof:SetText(self:L("GUIDE_NO_PROF"))
    f.range:SetText("")
    f.nodes:SetText("")
    f.zones:SetText("")
    f.routeTitle:SetText("")
    f.stageSelected:SetText("")
    f.routeSelected:SetText("")
    f.prevStage:Hide(); f.nextStage:Hide()
    f.prevRoute:Hide(); f.nextRoute:Hide()
    f.routeCaption:SetText("")
    f.image:SetTexture(nil)
    f.image:Hide()
    f.noImage:SetText(tChoiceCN(lang,
      "No route image is available for this profession yet.",
      "Aún no hay una imagen de ruta disponible para esta profesión.",
      "此专业暂无路线图片。"
    ))
    f.noImage:Show()
    for i=1,#f.routeButtons do f.routeButtons[i]:Hide() end
    f.note:SetText(self:L("GUIDE_LIGHT"))
    return
  end

  local stages=self.GuideData[category] or {}
  AG.guideCurrentStages=stages
  local defaultStageIndex=self:GetGuideStageIndex(category,skill) or 1
  if f.stageCategory~=category then
    f.stageCategory=category
    f.stageIndex=nil
  end
  if not f.stageIndex or f.stageIndex<1 or f.stageIndex>#stages then
    f.stageIndex=defaultStageIndex
  end
  local stage=stages[f.stageIndex] or self:GetGuideStage(category,skill)
  local stageKey=category..":"..(f.stageIndex or 1)..":"..stage.min..":"..stage.max
  if f.stageKey~=stageKey then
    f.stageKey=stageKey
    f.routeIndex=1
  end

  f.prof:SetText(self:L("PROFESSIONS")..": |cffffffff"..self:L(self.categoryKeys[category]).." "..skill.."|r")
  f.range:SetText(self:L("GUIDE_RANGE")..": |cffffcc55"..stage.min.." - "..stage.max.."|r")
  if #stages>1 then
    f.stageSelected:SetText("|cffdddddd"..(f.stageIndex or 1).."/"..#stages.."|r")
    f.prevStage:Show(); f.nextStage:Show()
  else
    f.stageSelected:SetText("")
    f.prevStage:Hide(); f.nextStage:Hide()
  end
  local nodeLabel=(category=="Skinning") and self:L("GUIDE_TARGETS") or self:L("GUIDE_NODES")
  local nodeText=tChoiceCN(lang, stage.nodesTextEN, stage.nodesTextES, stage.nodesTextCN) or nodeList(stage.nodes)
  f.nodes:SetText(nodeLabel..": |cffffffff"..(nodeText or "").."|r")
  local zones=tChoiceCN(lang, stage.zonesEN, stage.zonesES, stage.zonesCN)
  f.zones:SetText(self:L("GUIDE_ZONES")..":\n|cffffffff"..zones.."|r")
  f.note:SetText(self:L("GUIDE_LIGHT"))

  local routes=stage.routes or {}
  AG.guideCurrentRoutes=routes
  if #routes>0 then
    f.routeTitle:SetText(tChoiceCN(lang,"|cffffcc55Route maps|r","|cffffcc55Mapas de ruta|r","|cffffcc55路线地图|r"))
    f.prevRoute:Show(); f.nextRoute:Show()
    if not f.routeIndex or f.routeIndex>#routes then f.routeIndex=1 end
    for i=1,#f.routeButtons do
      local btn=f.routeButtons[i]
      local route=routes[i]
      if route then
        btn.routeIndex=i
        btn:SetText(tChoiceCN(lang, route.labelEN or ("Route "..i), route.labelES or route.labelEN or ("Ruta "..i), route.labelCN))
        btn:Show()
      else
        btn:Hide()
      end
    end

    local route=routes[f.routeIndex]
    if route then
      local routeName=tChoiceCN(lang, route.labelEN or ("Route "..f.routeIndex), route.labelES or route.labelEN or ("Ruta "..f.routeIndex), route.labelCN)
      f.routeSelected:SetText("|cffffffff"..routeName.."|r  |cff888888"..f.routeIndex.."/"..#routes.."|r")
      f.routeCaption:SetText("|cffffffff"..tChoiceCN(lang, route.captionEN or "", route.captionES or route.captionEN or "", route.captionCN).."|r")
      f.image:SetTexture(route.image)
      f.image:SetTexCoord(0,1,0,1)
      f.image:Show()
      f.noImage:Hide()
    end
  else
    f.routeTitle:SetText(tChoiceCN(lang,"|cffffcc55Route maps|r","|cffffcc55Mapas de ruta|r","|cffffcc55路线地图|r"))
    f.routeSelected:SetText("")
    f.prevRoute:Hide(); f.nextRoute:Hide()
    for i=1,#f.routeButtons do f.routeButtons[i]:Hide() end
    f.routeCaption:SetText("")
    f.image:SetTexture(nil)
    f.image:Hide()
    f.noImage:SetText(tChoiceCN(lang,
      "No route image is available for this level range yet. The text guide remains active.",
      "Aún no hay una imagen de ruta disponible para este rango de nivel. La guía de texto sigue activa.",
      "此等级范围暂无路线图片。文字指南仍然有效。"
    ))
    f.noImage:Show()
  end
  self:ApplyThemeDetails(f)
end

function AG:ToggleGuide()
  if not self.guide then self:InitializeGuide() end
  if self.guide:IsShown() then
    self.guide:Hide()
  else
    self.guide.stageIndex=nil
    self.guide.routeIndex=nil
    self:RefreshGuide()
    self.guide:Show()
  end
end
