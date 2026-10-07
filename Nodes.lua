local AG = AleeGather
AG.Nodes = AG.Nodes or {}
AG.NodeByName = AG.NodeByName or {}

local function add(id, category, en, es, mx, skill)
  local n = { id=id, category=category, en=en, es=es or en, mx=mx or es or en, skill=skill or 0 }
  AG.Nodes[id] = n
  AG.NodeByName[string.lower(en)] = id
  AG.NodeByName[string.lower(n.es)] = id
  AG.NodeByName[string.lower(n.mx)] = id
end

add(101, "Fishing", "Floating Wreckage", "Restos de un naufragio", "Restos de un naufragio", 0)
add(102, "Fishing", "Patch of Elemental Water", "[Patch of Elemental Water]", "[Patch of Elemental Water]", 0)
add(103, "Fishing", "Floating Debris", "Restos flotando", "Restos flotando", 0)
add(104, "Fishing", "Oil Spill", "Vertido de petróleo", "Vertido de petróleo", 0)
add(105, "Fishing", "Firefin Snapper School", "Banco de pargos de fuego", "Banco de pargos de fuego", 0)
add(106, "Fishing", "Greater Sagefish School", "Banco de sabiolas superior", "Banco de sabiolas superior", 0)
add(107, "Fishing", "Oily Blackmouth School", "Banco de bocanegras grasos", "Banco de bocanegras grasos", 0)
add(108, "Fishing", "Sagefish School", "Banco de sabiolas", "Banco de sabiolas", 0)
add(109, "Fishing", "School of Deviate Fish", "Banco de peces descarriados", "Banco de peces descarriados", 0)
add(110, "Fishing", "Stonescale Eel Swarm", "Banco de anguilas escama pétrea", "Banco de anguilas escama pétrea", 0)
add(111, "Fishing", "Muddy Churning Water", "[Muddy Churning Water]", "[Muddy Churning Water]", 0)
add(112, "Fishing", "Highland Mixed School", "Banco mixto de las Tierras Altas", "Banco mixto de las Tierras Altas", 0)
add(113, "Fishing", "Pure Water", "Agua pura", "Agua pura", 0)
add(114, "Fishing", "Bluefish School", "Banco de pezazules", "Banco de pezazules", 0)
add(115, "Fishing", "Feltail School", "Banco de colaviles", "Banco de colaviles", 0)
add(116, "Fishing", "Mudfish School", "Banco de peces barro", "Banco de peces barro", 0)
add(117, "Fishing", "School of Darter", "Banco de dardos", "Banco de dardos", 0)
add(118, "Fishing", "Sporefish School", "Banco de pecesporas", "Banco de pecesporas", 0)
add(119, "Fishing", "Steam Pump Flotsam", "Restos flotantes de bomba de vapor", "Restos flotantes de bomba de vapor", 0)
add(120, "Fishing", "School of Tastyfish", "Banco de pezricos", "Banco de pezricos", 0)
add(121, "Fishing", "Borean Man O' War School", "Banco de carabelas boreales", "Banco de carabelas boreales", 0)
add(122, "Fishing", "Deep Sea Monsterbelly School", "Banco de tripayuyus de las profundidades", "Banco de tripayuyus de las profundidades", 0)
add(123, "Fishing", "Dragonfin Angelfish School", "Banco de peces ángel aletadragón", "Banco de peces ángel aletadragón", 0)
add(124, "Fishing", "Fangtooth Herring School", "Banco de arenques colmillo", "Banco de arenques colmillo", 0)
add(125, "Fishing", "Floating Wreckage Pool", "Banco de Restos de un naufragio", "Banco de Restos de un naufragio", 0)
add(126, "Fishing", "Glacial Salmon School", "Banco de salmones glaciales", "Banco de salmones glaciales", 0)
add(127, "Fishing", "Glassfin Minnow School", "Banco de pezqueñines aletacristal", "Banco de pezqueñines aletacristal", 0)
add(128, "Fishing", "Imperial Manta Ray School", "Banco de mantas raya imperiales", "Banco de mantas raya imperiales", 0)
add(129, "Fishing", "Moonglow Cuttlefish School", "Banco de sepias resplandor lunar", "Banco de sepias resplandor lunar", 0)
add(130, "Fishing", "Musselback Sculpin School", "Banco de peces escorpión mejillón", "Banco de peces escorpión mejillón", 0)
add(131, "Fishing", "Nettlefish School", "Banco de medusas", "Banco de medusas", 0)
add(132, "Fishing", "Strange Pool", "Banco extraño", "Banco extraño", 0)
add(133, "Fishing", "Schooner Wreckage", "Restos de goleta", "Restos de goleta", 0)
add(134, "Fishing", "Waterlogged Wreckage Pool", "Banco de Restos encharcados", "Banco de Restos encharcados", 0)
add(135, "Fishing", "Bloodsail Wreckage Pool", "Banco de Restos de los Velasangre", "Banco de Restos de los Velasangre", 0)
add(136, "Fishing", "Mixed Ocean School", "Banco de mezcla oceánica", "Banco de mezcla oceánica", 0)
add(201, "Mining", "Copper Vein", "Filón de cobre", "Filón de cobre", 1)
add(202, "Mining", "Tin Vein", "Filón de estaño", "Filón de estaño", 65)
add(203, "Mining", "Iron Deposit", "Depósito de hierro", "Depósito de hierro", 125)
add(204, "Mining", "Silver Vein", "Filón de plata", "Filón de plata", 75)
add(205, "Mining", "Gold Vein", "Filón de oro", "Filón de oro", 155)
add(206, "Mining", "Mithril Deposit", "Depósito de mitril", "Depósito de mitril", 175)
add(207, "Mining", "Ooze Covered Mithril Deposit", "Filón de mitril cubierto de moco", "Filón de mitril cubierto de moco", 175)
add(208, "Mining", "Truesilver Deposit", "Depósito de veraplata", "Depósito de veraplata", 230)
add(209, "Mining", "Ooze Covered Silver Vein", "Filón de plata cubierto de moco", "Filón de plata cubierto de moco", 75)
add(210, "Mining", "Ooze Covered Gold Vein", "Filón de oro cubierto de moco", "Filón de oro cubierto de moco", 155)
add(211, "Mining", "Ooze Covered Truesilver Deposit", "Filón de veraplata cubierta de moco", "Filón de veraplata cubierta de moco", 230)
add(212, "Mining", "Ooze Covered Rich Thorium Vein", "Filón de torio enriquecido cubierto de moco", "Filón de torio enriquecido cubierto de moco", 275)
add(213, "Mining", "Ooze Covered Thorium Vein", "Filón de torio cubierto de moco", "Filón de torio cubierto de moco", 245)
add(214, "Mining", "Small Thorium Vein", "Filón pequeño de torio", "Filón pequeño de torio", 245)
add(215, "Mining", "Rich Thorium Vein", "Filón de torio enriquecido", "Filón de torio enriquecido", 275)
add(216, "Mining", "Hakkari Thorium Vein", "Hakkari Thorium Vein", "Hakkari Thorium Vein", 0)
add(217, "Mining", "Dark Iron Deposit", "Depósito de Hierro negro", "Depósito de Hierro negro", 230)
add(218, "Mining", "Lesser Bloodstone Deposit", "Depósito de sangrita inferior", "Depósito de sangrita inferior", 75)
add(219, "Mining", "Incendicite Mineral Vein", "Filón de mineral de incendicita", "Filón de mineral de incendicita", 65)
add(220, "Mining", "Indurium Mineral Vein", "Filón de mineral de indurio", "Filón de mineral de indurio", 150)
add(221, "Mining", "Fel Iron Deposit", "Depósito de hierro vil", "Depósito de hierro vil", 275)
add(222, "Mining", "Adamantite Deposit", "Depósito de adamantita", "Depósito de adamantita", 325)
add(223, "Mining", "Rich Adamantite Deposit", "Depósito rico en adamantita", "Depósito rico en adamantita", 350)
add(224, "Mining", "Khorium Vein", "Filón de korio", "Filón de korio", 375)
add(225, "Mining", "Large Obsidian Chunk", "Trozo de obsidiana grande", "Gran Trozo obsidiana", 305)
add(226, "Mining", "Small Obsidian Chunk", "Pequeño fragmento de obsidiana", "Pequeño fragmento de obsidiana", 305)
add(227, "Mining", "Nethercite Deposit", "Depósito de abisalita", "Depósito de abisalita", 350)
add(228, "Mining", "Cobalt Deposit", "Depósito de cobalto", "Depósito de cobalto", 350)
add(229, "Mining", "Rich Cobalt Deposit", "Depósito de cobalto rico", "Depósito de cobalto rico", 375)
add(230, "Mining", "Titanium Vein", "Filón de titanio", "Filón de titanio", 450)
add(231, "Mining", "Saronite Deposit", "Depósito de saronita", "Depósito de saronita", 400)
add(232, "Mining", "Rich Saronite Deposit", "Depósito de saronita rico", "Depósito de saronita rico", 425)
add(301, "Extract Gas", "Windy Cloud", "Nube ventosa", "Nube ventosa", 0)
add(302, "Extract Gas", "Swamp Gas", "Gas de pantano", "Gas de pantano", 0)
add(303, "Extract Gas", "Arcane Vortex", "Vórtice arcano", "Vórtice arcano", 0)
add(304, "Extract Gas", "Felmist", "Bruma Vil", "Bruma Vil", 0)
add(305, "Extract Gas", "Steam Cloud", "Nube de vapor", "Nube de vapor", 0)
add(306, "Extract Gas", "Cinder Cloud", "Nube de ceniza", "Nube de ceniza", 0)
add(307, "Extract Gas", "Arctic Cloud", "Nube ártica", "Nube ártica", 0)
add(401, "Herb Gathering", "Peacebloom", "Flor de paz", "Flor de paz", 1)
add(402, "Herb Gathering", "Silverleaf", "Hojaplata", "Hojaplata", 1)
add(403, "Herb Gathering", "Earthroot", "Raíz de tierra", "Raíz de tierra", 15)
add(404, "Herb Gathering", "Mageroyal", "Marregal", "Marregal", 50)
add(405, "Herb Gathering", "Briarthorn", "Brezospina", "Brezospina", 70)
add(406, "Herb Gathering", "Swiftthistle", "Swiftthistle", "Swiftthistle", 0)
add(407, "Herb Gathering", "Stranglekelp", "Alga estranguladora", "Alga estranguladora", 85)
add(408, "Herb Gathering", "Bruiseweed", "Hierba cardenal", "Hierba cardenal", 100)
add(409, "Herb Gathering", "Wild Steelbloom", "Acérita salvaje", "Acérita salvaje", 115)
add(410, "Herb Gathering", "Grave Moss", "Musgo de tumba", "Musgo de tumba", 120)
add(411, "Herb Gathering", "Kingsblood", "Sangrerregia", "Sangrerregia", 125)
add(412, "Herb Gathering", "Liferoot", "Vidarraíz", "Vidarraíz", 150)
add(413, "Herb Gathering", "Fadeleaf", "Pálida", "Pálida", 160)
add(414, "Herb Gathering", "Goldthorn", "Espina de oro", "Espina de oro", 170)
add(415, "Herb Gathering", "Khadgar's Whisker", "Vibrisa de Khadgar", "Mostacho de Khadgar", 185)
add(416, "Herb Gathering", "Wintersbite", "Ivernalia", "Ivernalia", 195)
add(417, "Herb Gathering", "Firebloom", "Flor de fuego", "Flor de fuego", 205)
add(418, "Herb Gathering", "Purple Lotus", "Loto cárdeno", "Loto cárdeno", 210)
add(419, "Herb Gathering", "Wildvine", "Wildvine", "Wildvine", 0)
add(420, "Herb Gathering", "Arthas' Tears", "Lágrimas de Arthas", "Lágrimas de Arthas", 220)
add(421, "Herb Gathering", "Sungrass", "Solea", "Solea", 230)
add(422, "Herb Gathering", "Blindweed", "Carolina", "Carolina", 235)
add(423, "Herb Gathering", "Ghost Mushroom", "Champiñón fantasma", "Champiñón fantasma", 245)
add(424, "Herb Gathering", "Gromsblood", "Gromsanguina", "Gromsanguina", 250)
add(425, "Herb Gathering", "Golden Sansam", "Sansam dorado", "Sansam dorado", 260)
add(426, "Herb Gathering", "Dreamfoil", "Hojasueño", "Hojasueño", 270)
add(427, "Herb Gathering", "Mountain Silversage", "Salviargenta de montaña", "Salviargenta de montaña", 280)
add(428, "Herb Gathering", "Plaguebloom", "Flor de plaga", "Flor de peste", 285)
add(429, "Herb Gathering", "Icecap", "Setelo", "Setelo", 290)
add(430, "Herb Gathering", "Bloodvine", "Vid de sangre", "Vid de sangre", 0)
add(431, "Herb Gathering", "Black Lotus", "Loto negro", "Loto negro", 300)
add(432, "Herb Gathering", "Felweed", "Hierba vil", "Pasto vil", 300)
add(433, "Herb Gathering", "Dreaming Glory", "Gloria de ensueño", "Gloria de ensueño", 315)
add(434, "Herb Gathering", "Terocone", "Teropiña", "Teropiña", 325)
add(435, "Herb Gathering", "Ancient Lichen", "Liquen Antiguo", "Liquen Antiguo", 340)
add(436, "Herb Gathering", "Bloodthistle", "Cardo de sangre", "Cardo de sangre", 1)
add(437, "Herb Gathering", "Mana Thistle", "Cardo de maná", "Cardo de maná", 375)
add(438, "Herb Gathering", "Netherbloom", "Flor abisal", "Flor abisal", 350)
add(439, "Herb Gathering", "Nightmare Vine", "Vid pesadilla", "Vid pesadilla", 365)
add(440, "Herb Gathering", "Ragveil", "Velada", "Velada", 325)
add(441, "Herb Gathering", "Flame Cap", "Seta flamígera", "Seta flamígera", 335)
add(442, "Herb Gathering", "Netherdust Bush", "Arbusto de polvo abisal", "Arbusto de polvo abisal", 350)
add(443, "Herb Gathering", "Adder's Tongue", "Lengua de víboris", "Lengua víboris", 400)
add(444, "Herb Gathering", "Constrictor Grass", "Constrictor Grass", "Constrictor Grass", 0)
add(445, "Herb Gathering", "Deadnettle", "Deadnettle", "Deadnettle", 0)
add(446, "Herb Gathering", "Goldclover", "Trébol de oro", "Trébol de oro", 350)
add(447, "Herb Gathering", "Icethorn", "Espina de hielo", "Espina de hielo", 435)
add(448, "Herb Gathering", "Lichbloom", "Flor exánime", "Flor exánime", 425)
add(449, "Herb Gathering", "Talandra's Rose", "Rosa de Talandra", "Rosa de Talandra", 385)
add(450, "Herb Gathering", "Tiger Lily", "Lirio atigrado", "Lirio atigrado", 375)
add(451, "Herb Gathering", "Firethorn", "Espino de fuego", "Espino de fuego", 360)
add(452, "Herb Gathering", "Frozen Herb", "Hierba congelada", "Hierba congelada", 400)
add(453, "Herb Gathering", "Frost Lotus", "Loto de escarcha", "Loto de escarcha", 450)
add(501, "Treasure", "Giant Clam", "Almeja gigante", "Almeja gigante", 0)
add(502, "Treasure", "Battered Chest", "Cofre maltrecho", "Cofre maltrecho", 0)
add(503, "Treasure", "Tattered Chest", "Cofre ajado", "Cofre ajado", 0)
add(504, "Treasure", "Solid Chest", "Cofre macizo", "Cofre macizo", 0)
add(505, "Treasure", "Large Iron Bound Chest", "Cofre reforzado con hierro grande", "Cofre reforzado con hierro grande", 0)
add(506, "Treasure", "Large Solid Chest", "Cofre macizo grande", "Cofre macizo grande", 0)
add(507, "Treasure", "Large Battered Chest", "Cofre maltrecho grande", "Cofre maltrecho grande", 0)
add(508, "Treasure", "Buccaneer's Strongbox", "Caja fuerte de bucanero", "Caja fuerte de bucanero", 0)
add(509, "Treasure", "Large Mithril Bound Chest", "Cofre reforzado con mitril grande", "Cofre reforzado con mitril grande", 0)
add(510, "Treasure", "Large Darkwood Chest", "Cofre grande de Leñoscuro", "Cofre grande de Leñoscuro", 0)
add(511, "Treasure", "Un'Goro Dirt Pile", "Montón de porquería de Un'Goro", "Montón de porquería de Un'Goro", 0)
add(512, "Treasure", "Bloodpetal Sprout", "Brote pétalo de sangre", "Brote pétalo de sangre", 0)
add(513, "Treasure", "Blood of Heroes", "[Blood of Heroes]", "Sangre de héroes", 0)
add(514, "Treasure", "Practice Lockbox", "Arcón de prácticas", "Arcón de prácticas", 0)
add(515, "Treasure", "Battered Footlocker", "Baúl maltrecho", "Baúl maltrecho", 0)
add(516, "Treasure", "Waterlogged Footlocker", "Baúl con marcas de agua", "Baúl con marcas de agua", 0)
add(517, "Treasure", "Dented Footlocker", "Baúl abollado", "Baúl abollado", 0)
add(518, "Treasure", "Mossy Footlocker", "Baúl mohoso", "Baúl mohoso", 0)
add(519, "Treasure", "Scarlet Footlocker", "Baúl Escarlata", "Baúl Escarlata", 0)
add(520, "Treasure", "Burial Chest", "Sarcófago", "Sarcófago", 0)
add(521, "Treasure", "Fel Iron Chest", "Cofre de hierro vil", "Cofre de hierro vil", 0)
add(522, "Treasure", "Heavy Fel Iron Chest", "Cofre pesado de hierro vil", "Cofre pesado de hierro vil", 0)
add(523, "Treasure", "Adamantite Bound Chest", "Cofre reforzado con adamantita", "Cofre reforzado con adamantita", 0)
add(524, "Treasure", "Felsteel Chest", "Cofre de acero vil", "Cofre de acero vil", 0)
add(525, "Treasure", "Glowcap", "Fluochampiñón", "Fluochampiñón", 0)
add(526, "Treasure", "Wicker Chest", "Cofre de mimbre", "Cofre de mimbre", 0)
add(527, "Treasure", "Primitive Chest", "Cofre primitivo", "Cofre primitivo", 0)
add(528, "Treasure", "Solid Fel Iron Chest", "Cofre sólido de hierro vil", "Cofre sólido de hierro vil", 0)
add(529, "Treasure", "Bound Fel Iron Chest", "Cofre reforzado con hierro vil", "Cofre reforzado con hierro vil", 0)
add(530, "Treasure", "Bound Adamantite Chest", "Cofre reforzado con adamantita", "Cofre de Adamanita blindado", 0)
add(531, "Treasure", "Netherwing Egg", "Huevo de Ala Abisal", "Huevo de Ala Abisal", 0)
add(532, "Treasure", "Everfrost Chip", "Esquirla de siemprescarcha", "Esquirla de siemprescarcha", 0)
add(533, "Treasure", "Brightly Colored Egg", "Huevo de Colores Vivos", "Huevo de Colores Vivos", 0)
add(534, "Treasure", "Silken Treasure Chest", "Arqueta de seda", "Arqueta de seda", 0)
add(535, "Treasure", "Sturdy Treasure Chest", "Arqueta robusta", "Arqueta robusta", 0)
add(536, "Treasure", "Runestone Treasure Chest", "Arqueta de piedras rúnicas", "Arqueta de piedras rúnicas", 0)
add(537, "Treasure", "Silverbound Treasure Chest", "Arqueta reforzada con plata", "Arqueta reforzada con plata", 0)

-- Chinese node names from the zhCN locale. Registering them in NodeByName is
-- required for tooltip matching on zhCN/zhTW clients.
do
  local loc=AleeGatherLocales and AleeGatherLocales["zhCN"]
  local cn=loc and loc._nodes
  if cn then
    for id,name in pairs(cn) do
      local n=AG.Nodes[id]
      if n then n.cn=name; AG.NodeByName[string.lower(name)]=id end
    end
  end
  local aliases=loc and loc._nodesAliases
  if aliases then
    for id,name in pairs(aliases) do
      if AG.Nodes[id] then AG.NodeByName[string.lower(name)]=id end
    end
  end
end

function AG:GetNodeIDByName(name)
  if not name then return nil end
  name = string.gsub(name, '^%s+', '')
  name = string.gsub(name, '%s+$', '')
  return self.NodeByName[string.lower(name)]
end

function AG:GetNodeName(id)
  local n = self.Nodes[id]
  if not n then return ('Node '..tostring(id)) end
  local lang = self:GetLanguage()
  if lang == 'esMX' then return n.mx end
  if lang == 'esES' then return n.es end
  if (lang == 'zhCN' or lang == 'zhTW') and n.cn then return n.cn end
  return n.en
end

