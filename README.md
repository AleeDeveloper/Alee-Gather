# Summary

A lightweight gathering tracker for WoW WotLK 3.3.5a / Warmane with map nodes, minimap icons, farming radar, profession filters and multilingual support.

# Description

## Gather Alee

**Gather Alee** is a lightweight and modern gathering addon built specifically for **World of Warcraft: Wrath of the Lich King 3.3.5a**, with a strong focus on compatibility with **Warmane and other 3.3.5a private servers**.

It is designed to help players track gathering locations without relying on modern Retail APIs or heavy external libraries.

### Main Features

- Gathering nodes displayed on the **World Map**
- Gathering nodes displayed on the **Minimap**
- Lightweight **Farming Radar**
- Automatic profession detection
- Automatic filtering based on your professions
- Support for:
  - Mining
  - Herbalism
  - Fishing
  - Gas Clouds
  - Treasure nodes
- Individual gathering-node icons
- Profession-specific filtering
- Farming session tracker
- Pause and reset session controls
- Toggle categories directly from the session HUD
- Movable minimap button
- Configurable icon size and opacity
- Configurable radar size and range
- Estimated node status system
- Lightweight in-game gathering guide
- English, Spanish and Spanish Latin America / Mexico localization
- No Ace3 dependency
- Built natively for the old **WoW 3.3.5a API**

### Farming HUD

Gather Alee includes a compact farming HUD that tracks your gathering session.

It can display:

- Session duration
- Total gathered nodes
- Mining count
- Herbalism count
- Fishing count
- Gas cloud count
- Treasure count
- Last gathered node
- Detected gathering profession and current skill level

The HUD also includes controls to:

- Pause / Resume
- Reset the session
- Show / Hide the radar
- Open the gathering guide

### Farming Radar

The optional radar shows nearby known gathering nodes around your current position.

You can configure:

- Radar range
- Radar size
- Icon scale
- Radar opacity
- Visible gathering categories

The radar is intentionally lightweight and does not attempt to replace the game minimap.

### Automatic Profession Detection

Gather Alee can automatically detect your gathering professions.

For example:

- If you have **Mining**, mining nodes are shown automatically.
- If you have **Herbalism**, herb nodes are shown automatically.
- If you have **Fishing**, fishing pools can be displayed.
- Engineering can enable gas-cloud tracking.

You can disable automatic filtering at any time from the addon settings.

### Node Learning

Gather Alee can learn gathering locations while you play.

A node is only saved after a confirmed gathering interaction, reducing false or accidental node locations.

Learned locations are stored in:

`AleeGatherDB`

so your discoveries remain available between sessions.

### Node Status

Gather Alee includes an optional local node-status system.

- **Green** — node is considered available / not recently gathered
- **Black** — node was recently gathered and may still be unavailable

Please note that WoW 3.3.5a does not expose the live spawn state of every gathering node through the addon API. Status is therefore an estimation based on your local gathering history and configurable timers.

### In-Game Gathering Guide

A lightweight gathering guide is included.

It detects your profession and current skill level and suggests:

- Appropriate gathering nodes
- Recommended skill range
- Suggested zones

Open it with:

`/ag guide`

or:

`/ag guia`

### Commands

`/ag` — Open configuration  
`/aleegather` — Open configuration  
`/ag hud` — Toggle farming HUD  
`/ag radar` — Toggle farming radar  
`/ag guide` — Open gathering guide  
`/ag reset` — Reset farming session  
`/ag debug` — Toggle debug mode

### Languages

Currently supported:

- English — `enUS`
- Spanish — `esES`
- Latin American / Mexican Spanish — `esMX`

The addon can automatically use your WoW client language or you can select a language manually.

### Compatibility

Designed specifically for:

**World of Warcraft WotLK 3.3.5a — Interface 30300**

Tested primarily with:

- Warmane
- WoW 3.3.5a clients
- Common 3.3.5a UI addons

Gather Alee does **not** use Retail-only APIs such as `C_Map`, `C_Minimap` or modern MapCanvas systems.

### Important

Gather Alee is an independent addon and does not require GatherMate, Gatherer or Ace3 to function.

Node locations and behavior may vary between private servers because individual servers can modify gathering spawn locations, respawn timers and world databases.

### Feedback & Bugs

If you find:

- Incorrect node locations
- Missing node types
- UI compatibility problems
- Translation issues
- Problems with a specific 3.3.5a server

please report them so the addon can continue improving.

---

**Current branch:** WotLK 3.3.5a

Support for other WoW versions may be developed separately in the future.


<img width="291" height="277" alt="Captura de pantalla 2026-09-29 232657" src="https://github.com/user-attachments/assets/7361d11f-31bb-484e-97a7-2554fe027d61" />
<img width="378" height="197" alt="Captura de pantalla 2026-09-29 232652" src="https://github.com/user-attachments/assets/e772df99-5cd5-4437-9437-8f71bcd912b0" />
<img width="1619" height="785" alt="Captura de pantalla 2026-09-29 232642" src="https://github.com/user-attachments/assets/171379a6-eaf3-47b4-b669-04ba7243571c" />
<img width="387" height="244" alt="Captura de pantalla 2026-09-29 232038" src="https://github.com/user-attachments/assets/3220093e-c201-44a6-b790-50dee421b13c" />
