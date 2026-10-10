local AG=AleeGather

AG.GuideData = {
  Mining = {
    {
      min=1,max=64,nodes={201},
      zonesEN="Elwynn Forest, Dun Morogh, Durotar, Mulgore, Tirisfal Glades, Darkshore",
      zonesES="Bosque de Elwynn, Dun Morogh, Durotar, Mulgore, Claros de Tirisfal, Costa Oscura",
      routes={
        {
          labelEN="Durotar", labelES="Durotar",
          captionEN="After you pass Razor Hill, go inside the cave marked on the map before you jump down!",
          captionES="Después de pasar por Cerrotajo, entra a la cueva marcada en el mapa antes de bajar.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_1_65_Durotar.tga",
        },
        {
          labelEN="Elwynn", labelES="Elwynn",
          captionEN="Low level players should skip both caves.",
          captionES="Los jugadores de nivel bajo deberían evitar ambas cuevas.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_1_65_Elwynn.tga",
        },
      },
    },
    {
      min=65,max=124,nodes={202,204,201},
      zonesEN="Hillsbrad Foothills, Redridge Mountains, Ashenvale, The Barrens",
      zonesES="Laderas de Trabalomas, Montañas Crestagrana, Vallefresno, Los Baldíos",
      routes={
        {labelEN="Hillsbrad", labelES="Trabalomas", captionEN="Tin, Silver and Copper route in Hillsbrad Foothills.", captionES="Ruta de estaño, plata y cobre en Laderas de Trabalomas.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Hillsbrad.tga"},
        {labelEN="Redridge", labelES="Crestagrana", captionEN="Efficient mining loop in Redridge Mountains.", captionES="Ruta eficiente de minería en Montañas Crestagrana.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Redridge.tga"},
        {labelEN="Ashenvale", labelES="Vallefresno", captionEN="Alternative route in Ashenvale.", captionES="Ruta alternativa en Vallefresno.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Ashenvale.tga"},
        {labelEN="Barrens", labelES="Baldíos", captionEN="Alternative route in The Barrens.", captionES="Ruta alternativa en Los Baldíos.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_65_124_Barrens.tga"},
      },
    },
    {
      min=125,max=174,nodes={203,205},
      zonesEN="Arathi Highlands, Desolace, Thousand Needles",
      zonesES="Tierras Altas de Arathi, Desolace, Las Mil Agujas",
      routes={
        {labelEN="Arathi", labelES="Arathi", captionEN="Iron route in Arathi Highlands.", captionES="Ruta de hierro en Tierras Altas de Arathi.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_Arathi.tga"},
        {labelEN="Desolace", labelES="Desolace", captionEN="Alternative route in Desolace.", captionES="Ruta alternativa en Desolace.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_Desolace.tga"},
        {labelEN="1K Needles", labelES="Mil Agujas", captionEN="Alternative route in Thousand Needles.", captionES="Ruta alternativa en Las Mil Agujas.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_125_174_ThousandNeedles.tga"},
      },
    },
    {
      min=175,max=244,nodes={206,208},
      zonesEN="The Hinterlands, Tanaris",
      zonesES="Tierras del Interior, Tanaris",
      routes={
        {labelEN="Hinterlands", labelES="Tierras Int.", captionEN="Mithril route in The Hinterlands.", captionES="Ruta de mitril en Tierras del Interior.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_175_244_Hinterlands.tga"},
        {labelEN="Tanaris", labelES="Tanaris", captionEN="Alternative route in Tanaris.", captionES="Ruta alternativa en Tanaris.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_175_244_Tanaris.tga"},
      },
    },
    {
      min=245,max=274,nodes={214,206,208},
      zonesEN="Un'Goro Crater, Blasted Lands, Felwood",
      zonesES="Cráter de Un'Goro, Las Tierras Devastadas, Frondavil",
      routes={
        {labelEN="Un'Goro", labelES="Un'Goro", captionEN="Small Thorium route in Un'Goro Crater.", captionES="Ruta de torio pequeño en el Cráter de Un'Goro.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_UnGoroSmall.tga"},
        {labelEN="Blasted", labelES="Devastadas", captionEN="Alternative route in Blasted Lands.", captionES="Ruta alternativa en Las Tierras Devastadas.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_BlastedLands.tga"},
        {labelEN="Felwood", labelES="Frondavil", captionEN="Alternative route in Felwood.", captionES="Ruta alternativa en Frondavil.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_245_274_Felwood.tga"},
      },
    },
    {
      min=275,max=299,nodes={215,214},
      zonesEN="Un'Goro Crater, Eastern Plaguelands, Winterspring, Burning Steppes",
      zonesES="Cráter de Un'Goro, Tierras de la Peste del Este, Cuna del Invierno, Estepas Ardientes",
      routes={
        {labelEN="Un'Goro Rich", labelES="Un'Goro Rico", captionEN="Rich Thorium route in Un'Goro Crater.", captionES="Ruta de torio rico en el Cráter de Un'Goro.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_UnGoroRich.tga"},
        {labelEN="E. Plague", labelES="Peste Este", captionEN="Alternative route in Eastern Plaguelands.", captionES="Ruta alternativa en Tierras de la Peste del Este.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_EasternPlaguelands.tga"},
        {labelEN="Winterspring", labelES="Invierno", captionEN="Alternative route in Winterspring.", captionES="Ruta alternativa en Cuna del Invierno.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_Winterspring.tga"},
        {labelEN="Burning", labelES="Ardientes", captionEN="Alternative route in Burning Steppes.", captionES="Ruta alternativa en Estepas Ardientes.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_275_299_BurningSteppes.tga"},
      },
    },
    {
      min=300,max=324,nodes={221},
      zonesEN="Hellfire Peninsula",
      zonesES="Península del Fuego Infernal",
      routes={
        {labelEN="Hellfire 1", labelES="Hellfire 1", captionEN="Fel Iron route in Hellfire Peninsula.", captionES="Ruta de hierro vil en Península del Fuego Infernal.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_300_324_Hellfire1.tga"},
        {labelEN="Hellfire 2", labelES="Hellfire 2", captionEN="Alternative Hellfire Peninsula route.", captionES="Ruta alternativa en Península del Fuego Infernal.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_300_324_Hellfire2.tga"},
      },
    },
    {
      min=325,max=349,nodes={222},
      zonesEN="Zangarmarsh, Terokkar Forest",
      zonesES="Marisma de Zangar, Bosque de Terokkar",
      routes={
        {labelEN="Zangar", labelES="Zangar", captionEN="Adamantite route in Zangarmarsh.", captionES="Ruta de adamantita en Marisma de Zangar.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Zangarmarsh.tga"},
        {labelEN="Terokkar 1", labelES="Terokkar 1", captionEN="Alternative Terokkar Forest route.", captionES="Ruta alternativa en Bosque de Terokkar.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Terrokar1.tga"},
        {labelEN="Terokkar 2", labelES="Terokkar 2", captionEN="Second Terokkar Forest route.", captionES="Segunda ruta en Bosque de Terokkar.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_325_349_Terrokar2.tga"},
      },
    },
    {
      min=350,max=399,nodes={228,229},
      zonesEN="Borean Tundra, Howling Fjord",
      zonesES="Tundra Boreal, Fiordo Aquilonal",
      routes={
        {labelEN="Borean", labelES="Boreal", captionEN="Cobalt route in Borean Tundra.", captionES="Ruta de cobalto en Tundra Boreal.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_BoreanTundra.tga"},
        {labelEN="Borean NF", labelES="Boreal SF", captionEN="Borean Tundra route without flying.", captionES="Ruta en Tundra Boreal sin montura voladora.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_BoreanTundra_NoFlying.tga"},
        {labelEN="Howling", labelES="Aquilonal", captionEN="Cobalt route in Howling Fjord.", captionES="Ruta de cobalto en Fiordo Aquilonal.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_HowlingFjord.tga"},
        {labelEN="Howling NF", labelES="Aquilonal SF", captionEN="Howling Fjord route without flying.", captionES="Ruta en Fiordo Aquilonal sin montura voladora.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_350_399_HowlingFjord_NoFlying.tga"},
      },
    },
    {
      min=400,max=450,nodes={231,232,230},
      zonesEN="Sholazar Basin, The Storm Peaks",
      zonesES="Cuenca de Sholazar, Las Cumbres Tormentosas",
      routes={
        {labelEN="Sholazar", labelES="Sholazar", captionEN="Saronite route in Sholazar Basin.", captionES="Ruta de saronita en Cuenca de Sholazar.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_400_450_Sholazar.tga"},
        {labelEN="Storm Peaks", labelES="Tormentosas", captionEN="Saronite and Titanium route in The Storm Peaks.", captionES="Ruta de saronita y titanio en Las Cumbres Tormentosas.", image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Mining_400_450_StormPeaks.tga"},
      },
    },
  },
  ["Herb Gathering"] = {
    {
      min=1,max=69,nodes={401,402,403},
      zonesEN="Any starter zone",
      zonesES="Cualquier zona inicial",
      routes={
        {
          labelEN="Durotar", labelES="Durotar",
          captionEN="Herbalism route in Durotar.",
          captionES="Ruta de herboristería en Durotar.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Durotar.tga",
        },
        {
          labelEN="Elwynn", labelES="Elwynn",
          captionEN="Herbalism route in Elwynn.",
          captionES="Ruta de herboristería en Elwynn.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Elwynn.tga",
        },
        {
          labelEN="Dun Morogh", labelES="Dun Morogh",
          captionEN="Herbalism route in Dun Morogh.",
          captionES="Ruta de herboristería en Dun Morogh.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_DunMorogh.tga",
        },
        {
          labelEN="Mulgore", labelES="Mulgore",
          captionEN="Herbalism route in Mulgore.",
          captionES="Ruta de herboristería en Mulgore.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Mulgore.tga",
        },
        {
          labelEN="Teldrassil", labelES="Teldrassil",
          captionEN="Herbalism route in Teldrassil.",
          captionES="Ruta de herboristería en Teldrassil.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Teldrassil.tga",
        },
        {
          labelEN="Tirisfal", labelES="Tirisfal",
          captionEN="Herbalism route in Tirisfal.",
          captionES="Ruta de herboristería en Tirisfal.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_1_69_Tirisfal.tga",
        },
      },
    },
    {
      min=70,max=114,nodes={404,407,408},
      zonesEN="The Barrens, Silverpine Forest, Loch Modan, Darkshore",
      zonesES="Los Baldíos, Bosque de Argénteos, Loch Modan, Costa Oscura",
      routes={
        {
          labelEN="Barrens", labelES="Los Baldíos",
          captionEN="Herbalism route in Barrens.",
          captionES="Ruta de herboristería en Los Baldíos.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Barrens.tga",
        },
        {
          labelEN="Silverpine", labelES="Bosque de Argénteos",
          captionEN="Herbalism route in Silverpine.",
          captionES="Ruta de herboristería en Bosque de Argénteos.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Silverpine.tga",
        },
        {
          labelEN="Loch Modan", labelES="Loch Modan",
          captionEN="Herbalism route in Loch Modan.",
          captionES="Ruta de herboristería en Loch Modan.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_LochModan.tga",
        },
        {
          labelEN="Darkshore", labelES="Costa Oscura",
          captionEN="Herbalism route in Darkshore.",
          captionES="Ruta de herboristería en Costa Oscura.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_70_114_Darkshore.tga",
        },
      },
    },
    {
      min=115,max=169,nodes={409,410,408,411,412},
      zonesEN="Hillsbrad Foothills, Wetlands, Stonetalon Mountains",
      zonesES="Laderas de Trabalomas, Los Humedales, Sierra Espolón",
      routes={
        {
          labelEN="Hillsbrad", labelES="Trabalomas",
          captionEN="Herbalism route in Hillsbrad.",
          captionES="Ruta de herboristería en Trabalomas.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Hillsbrad.tga",
        },
        {
          labelEN="Wetlands", labelES="Los Humedales",
          captionEN="Herbalism route in Wetlands.",
          captionES="Ruta de herboristería en Los Humedales.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Wetlands.tga",
        },
        {
          labelEN="Stonetalon", labelES="Sierra Espolón",
          captionEN="Herbalism route in Stonetalon.",
          captionES="Ruta de herboristería en Sierra Espolón.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_115_169_Stonetalon.tga",
        },
      },
    },
    {
      min=170,max=204,nodes={411,412,413,414,415},
      zonesEN="Stranglethorn Vale, Arathi Highlands",
      zonesES="Vega de Tuercespina, Tierras Altas de Arathi",
      routes={
        {
          labelEN="Stranglethorn", labelES="Tuercespina",
          captionEN="Herbalism route in Stranglethorn.",
          captionES="Ruta de herboristería en Tuercespina.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_170_204_STV.tga",
        },
        {
          labelEN="Arathi", labelES="Arathi",
          captionEN="Herbalism route in Arathi.",
          captionES="Ruta de herboristería en Arathi.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_170_204_Arathi.tga",
        },
      },
    },
    {
      min=205,max=229,nodes={417,418},
      zonesEN="Tanaris, Searing Gorge",
      zonesES="Tanaris, La Garganta de Fuego",
      routes={
        {
          labelEN="Tanaris", labelES="Tanaris",
          captionEN="Herbalism route in Tanaris.",
          captionES="Ruta de herboristería en Tanaris.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_205_229_Tanaris.tga",
        },
        {
          labelEN="Searing Gorge", labelES="Garganta de Fuego",
          captionEN="Herbalism route in Searing Gorge.",
          captionES="Ruta de herboristería en Garganta de Fuego.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_205_229_SearingGorge.tga",
        },
      },
    },
    {
      min=230,max=269,nodes={421,422,423,424,425},
      zonesEN="Feralas, The Hinterlands",
      zonesES="Feralas, Tierras del Interior",
      routes={
        {
          labelEN="Hinterlands", labelES="Tierras del Interior",
          captionEN="Herbalism route in Hinterlands.",
          captionES="Ruta de herboristería en Tierras del Interior.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_230_269_Hinterlands.tga",
        },
      },
    },
    {
      min=270,max=299,nodes={426,427,428,429},
      zonesEN="Felwood, Western Plaguelands, Eastern Plaguelands",
      zonesES="Frondavil, Tierras de la Peste del Oeste, Tierras de la Peste del Este",
      routes={
        {
          labelEN="Felwood", labelES="Frondavil",
          captionEN="Herbalism route in Felwood.",
          captionES="Ruta de herboristería en Frondavil.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_270_299_Felwood.tga",
        },
      },
    },
    {
      min=300,max=349,nodes={431,432,433,434,435},
      zonesEN="Hellfire Peninsula, Terokkar Forest, Nagrand, Blade's Edge Mountains, Netherstorm",
      zonesES="Península del Fuego Infernal, Bosque de Terokkar, Nagrand, Montañas Filospada, Tormenta Abisal",
      routes={
        {
          labelEN="Hellfire", labelES="Fuego Infernal",
          captionEN="Herbalism route in Hellfire.",
          captionES="Ruta de herboristería en Fuego Infernal.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Hellfire.tga",
        },
        {
          labelEN="Terokkar", labelES="Terokkar",
          captionEN="Herbalism route in Terokkar.",
          captionES="Ruta de herboristería en Terokkar.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Terokkar.tga",
        },
        {
          labelEN="Nagrand", labelES="Nagrand",
          captionEN="Herbalism route in Nagrand.",
          captionES="Ruta de herboristería en Nagrand.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Nagrand.tga",
        },
        {
          labelEN="Blade's Edge", labelES="Montañas Filospada",
          captionEN="Herbalism route in Blade's Edge.",
          captionES="Ruta de herboristería en Montañas Filospada.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_BladesEdge.tga",
        },
        {
          labelEN="Netherstorm", labelES="Tormenta Abisal",
          captionEN="Herbalism route in Netherstorm.",
          captionES="Ruta de herboristería en Tormenta Abisal.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_300_349_Netherstorm.tga",
        },
      },
    },
    {
      min=350,max=399,nodes={438,440,441,450},
      zonesEN="Borean Tundra, Howling Fjord, Grizzly Hills",
      zonesES="Tundra Boreal, Fiordo Aquilonal, Colinas Pardas",
      routes={
        {
          labelEN="Borean Tundra", labelES="Tundra Boreal",
          captionEN="Herbalism route in Borean Tundra.",
          captionES="Ruta de herboristería en Tundra Boreal.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_Borean.tga",
        },
        {
          labelEN="Howling Fjord", labelES="Fiordo Aquilonal",
          captionEN="Herbalism route in Howling Fjord.",
          captionES="Ruta de herboristería en Fiordo Aquilonal.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_HowlingFjord.tga",
        },
        {
          labelEN="Grizzly Hills", labelES="Colinas Pardas",
          captionEN="Herbalism route in Grizzly Hills.",
          captionES="Ruta de herboristería en Colinas Pardas.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_350_399_GrizzlyHills.tga",
        },
      },
    },
    {
      min=400,max=434,nodes={442,443,451},
      zonesEN="Sholazar Basin, Zul'Drak",
      zonesES="Cuenca de Sholazar, Zul'Drak",
      routes={
        {
          labelEN="Sholazar 1", labelES="Sholazar 1",
          captionEN="Herbalism route in Sholazar 1.",
          captionES="Ruta de herboristería en Sholazar 1.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_400_434_Sholazar1.tga",
        },
        {
          labelEN="Sholazar 2", labelES="Sholazar 2",
          captionEN="Herbalism route in Sholazar 2.",
          captionES="Ruta de herboristería en Sholazar 2.",
          image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Herbalism_400_434_Sholazar2.tga",
        },
      },
    },
    {
      min=435,max=450,nodes={447,448},
      zonesEN="The Storm Peaks, Icecrown",
      zonesES="Las Cumbres Tormentosas, Corona de Hielo",
      routes={
        {
          labelEN="Storm Peaks", labelES="Cumbres Tormentosas",
          captionEN="Herbalism route in Storm Peaks.",
          captionES="Ruta de herboristería en Cumbres Tormentosas.",
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
      zonesEN="Durotar, Dun Morogh",
      zonesES="Durotar, Dun Morogh",
      routes={
{
  labelEN="Durotar", labelES="Durotar",
  captionEN="Kill and skin boars, scorpids and other low-level beasts while moving from Sen'jin Village toward Orgrimmar.",
  captionES="Mata y desuella jabalíes, escórpidos y otras bestias de bajo nivel mientras avanzas desde Sen'jin hacia Orgrimmar.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_1_75_Durotar.tga",
},{
  labelEN="Dun Morogh", labelES="Dun Morogh",
  captionEN="Make circles around the lake near Ironforge and skin boars, wolves, bears and other nearby beasts.",
  captionES="Da vueltas alrededor del lago cerca de Forjaz y desuella jabalíes, lobos, osos y otras bestias cercanas.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_1_75_DunMorogh.tga",
},      },
    },
    {
      min=75,max=164,nodes={},
      nodesTextEN="Zhevras, plainstriders, lions, crocolisks, spiders and raptors",
      nodesTextES="Zhevras, acechadores de llanura, leones, crocoliscos, arañas y raptores",
      zonesEN="The Barrens, Loch Modan, Wetlands",
      zonesES="Los Baldíos, Loch Modan, Los Humedales",
      routes={
{
  labelEN="Barrens", labelES="Baldíos",
  captionEN="Skin zhevras, plainstriders, lions and other beasts on the road toward Camp Taurajo.",
  captionES="Desuella zhevras, acechadores de llanura, leones y otras bestias en el camino hacia Camp Taurajo.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_Barrens.tga",
},{
  labelEN="Loch Modan", labelES="Loch Modan",
  captionEN="Follow the route and skin bears, boars, spiders and other beasts around Loch Modan.",
  captionES="Sigue la ruta y desuella osos, jabalíes, arañas y otras bestias alrededor de Loch Modan.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_LochModan.tga",
},{
  labelEN="Wetlands", labelES="Los Humedales",
  captionEN="Follow the river and skin crocolisks, raptors and spiders on the way to Menethil Harbor.",
  captionES="Sigue el río y desuella crocoliscos, raptores y arañas camino a Menethil.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_75_165_Wetlands.tga",
},      },
    },
    {
      min=165,max=204,nodes={},
      nodesTextEN="Hyenas, cougars and raptors",
      nodesTextES="Hienas, pumas y raptores",
      zonesEN="Thousand Needles, Arathi Highlands",
      zonesES="Mil Agujas, Tierras Altas de Arathi",
      routes={
{
  labelEN="Thousand Needles", labelES="Mil Agujas",
  captionEN="Skin hyenas, cougars and then the higher-level raptors in the marked orange section.",
  captionES="Desuella hienas, pumas y luego los raptores de mayor nivel en la zona naranja marcada.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_165_205_ThousandNeedles.tga",
},{
  labelEN="Arathi", labelES="Arathi",
  captionEN="Focus mainly on the raptors in Arathi Highlands, especially the higher-level packs in the southeast.",
  captionES="Concéntrate sobre todo en los raptores de Arathi, especialmente en los grupos de mayor nivel del sureste.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_165_205_Arathi.tga",
},      },
    },
    {
      min=205,max=299,nodes={},
      nodesTextEN="Yetis, hippogryphs, dinosaurs and other high-level beasts",
      nodesTextES="Yetis, hipogrifos, dinosaurios y otras bestias de mayor nivel",
      zonesEN="Feralas, Un'Goro Crater",
      zonesES="Feralas, Cráter de Un'Goro",
      routes={
{
  labelEN="Feralas", labelES="Feralas",
  captionEN="Start around Camp Mojache, then move to the Yeti cave; Hippogryphs are a good backup if the cave is crowded.",
  captionES="Comienza alrededor de Camp Mojache y luego ve a la cueva de yetis; los hipogrifos son buen respaldo si la cueva está ocupada.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_205_300_Feralas.tga",
},{
  labelEN="Un'Goro", labelES="Un'Goro",
  captionEN="Skin dinosaurs, pterrordaxes and other beasts all around Un'Goro Crater.",
  captionES="Desuella dinosaurios, pterrordáctilos y otras bestias por todo el Cráter de Un'Goro.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_205_300_UnGoro.tga",
},      },
    },
    {
      min=300,max=349,nodes={},
      nodesTextEN="Helboars, Ravagers, Talbuks and Clefthoofs",
      nodesTextES="Jabalíes viles, devastadores, talbuks y uñagrietas",
      zonesEN="Hellfire Peninsula, Nagrand",
      zonesES="Península del Fuego Infernal, Nagrand",
      routes={
{
  labelEN="Hellfire", labelES="Fuego Infernal",
  captionEN="Start with Starving Helboars, then Deranged Helboars, and later Razorfang Hatchlings and Ravagers.",
  captionES="Comienza con los jabalíes viles hambrientos, luego los trastornados y después crías y devastadores colmiferoces.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_300_350_Hellfire.tga",
},{
  labelEN="Nagrand", labelES="Nagrand",
  captionEN="Kill and skin Talbuks and Clefthoofs around the marked area.",
  captionES="Mata y desuella talbuks y uñagrietas en la zona marcada.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_300_350_Nagrand.tga",
},      },
    },
    {
      min=350,max=394,nodes={},
      nodesTextEN="Wooly Rhino Matriarchs and Wooly Rhino Calves",
      nodesTextES="Matriarcas de rinoceronte lanudo y crías",
      zonesEN="Borean Tundra",
      zonesES="Tundra Boreal",
      routes={
{
  labelEN="Borean Tundra", labelES="Tundra Boreal",
  captionEN="Skin Wooly Rhino Matriarchs and Wooly Rhino Calves north and south of Warsong Hold.",
  captionES="Desuella matriarcas de rinoceronte lanudo y crías al norte y sur del Bastión Grito de Guerra.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_350_395_BoreanTundra.tga",
},      },
    },
    {
      min=395,max=450,nodes={},
      nodesTextEN="Hardknuckle Foragers and Hardknuckle Chargers",
      nodesTextES="Recolectores y cargadores Nudillos Duros",
      zonesEN="Sholazar Basin",
      zonesES="Cuenca de Sholazar",
      routes={
{
  labelEN="Sholazar Basin", labelES="Sholazar",
  captionEN="Skin Hardknuckle Foragers and Hardknuckle Chargers around Frenzyheart Hill.",
  captionES="Desuella recolectores y cargadores Nudillos Duros alrededor de la Colina Corazón Frenético.",
  image="Interface\\AddOns\\AleeGather\\Artwork\\GuideRoutes\\Skinning_395_450_Sholazar.tga",
},      },
    },
  },
}

local function isSpanish(lang)
  return lang=="esES" or lang=="esMX"
end

local function tChoice(lang,en,es)
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
    f.noImage:SetText(tChoice(lang,"No route image is available for this profession yet.","Aún no hay una imagen de ruta disponible para esta profesión."))
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
  local nodeText=((lang=="enUS") and stage.nodesTextEN or stage.nodesTextES) or nodeList(stage.nodes)
  f.nodes:SetText(nodeLabel..": |cffffffff"..(nodeText or "").."|r")
  local zones=(lang=="enUS") and stage.zonesEN or stage.zonesES
  f.zones:SetText(self:L("GUIDE_ZONES")..":\n|cffffffff"..zones.."|r")
  f.note:SetText(self:L("GUIDE_LIGHT"))

  local routes=stage.routes or {}
  AG.guideCurrentRoutes=routes
  if #routes>0 then
    f.routeTitle:SetText(tChoice(lang,"|cffffcc55Route maps|r", "|cffffcc55Mapas de ruta|r"))
    f.prevRoute:Show(); f.nextRoute:Show()
    if not f.routeIndex or f.routeIndex>#routes then f.routeIndex=1 end
    for i=1,#f.routeButtons do
      local btn=f.routeButtons[i]
      local route=routes[i]
      if route then
        btn.routeIndex=i
        btn:SetText(tChoice(lang, route.labelEN or ("Route "..i), route.labelES or route.labelEN or ("Ruta "..i)))
        btn:Show()
      else
        btn:Hide()
      end
    end

    local route=routes[f.routeIndex]
    if route then
      local routeName=tChoice(lang, route.labelEN or ("Route "..f.routeIndex), route.labelES or route.labelEN or ("Ruta "..f.routeIndex))
      f.routeSelected:SetText("|cffffffff"..routeName.."|r  |cff888888"..f.routeIndex.."/"..#routes.."|r")
      f.routeCaption:SetText("|cffffffff"..tChoice(lang, route.captionEN or "", route.captionES or route.captionEN or "").."|r")
      f.image:SetTexture(route.image)
      f.image:SetTexCoord(0,1,0,1)
      f.image:Show()
      f.noImage:Hide()
    end
  else
    f.routeTitle:SetText(tChoice(lang,"|cffffcc55Route maps|r","|cffffcc55Mapas de ruta|r"))
    f.routeSelected:SetText("")
    f.prevRoute:Hide(); f.nextRoute:Hide()
    for i=1,#f.routeButtons do f.routeButtons[i]:Hide() end
    f.routeCaption:SetText("")
    f.image:SetTexture(nil)
    f.image:Hide()
    f.noImage:SetText(tChoice(lang,
      "No route image is available for this level range yet. The text guide remains active.",
      "Aún no hay una imagen de ruta disponible para este rango de nivel. La guía de texto sigue activa."
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
