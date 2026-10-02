# Gather Alee

Gather Alee is a lightweight and standalone gathering addon for **World of Warcraft: Wrath of the Lich King 3.3.5a**, with a strong focus on compatibility with **Warmane** and other 3.3.5a private servers.

It provides gathering node tracking, profession detection, farming sessions, route guides and lightweight map/radar tools without requiring modern Retail APIs or heavy addon frameworks.

## Features

- World Map gathering nodes
- Minimap gathering nodes
- Lightweight Farming Radar
- Farming Session HUD
- Real gathered-item counters
- Session timer with pause/resume
- Profession-based filtering
- Optional profession-filter unlock
- Shared learned-node database between characters
- Adaptive respawn estimation
- Independent opacity controls
- GatherMate_Data import support
- English, Spanish ES and Spanish LATAM/MX localization
- No Ace3 dependency

## Supported Gathering Types

- Mining
- Herbalism
- Skinning
- Fishing
- Gas Clouds (Engineering)
- Treasure

## Profession Guides

### Mining
- Skill progression from 1 to 450
- Recommended zones
- Node skill requirements
- Route maps
- Multiple route selection
- Stage navigation

### Herbalism
- Skill progression from 1 to 450
- Recommended zones
- Herb requirements
- Route maps
- Multiple route selection
- Stage navigation

### Skinning
- Skill progression from 1 to 450
- Recommended zones
- Route maps
- Suggested creatures to kill and skin
- Outland and Northrend progression

## Farming Session HUD

The farming session tracks gathered materials by category:

- Herbalism
- Mining
- Fishing
- Gas Clouds
- Treasure
- Skinning

The session timer can be paused independently while gathering counters continue tracking.

## Respawn Estimation

WoW 3.3.5a does not provide addons with exact server-side gathering node respawn information.

Gather Alee therefore uses:

- Estimated respawn timers
- Recently gathered node states
- Adaptive respawn learning
- Local gathering history

Respawn status is an estimate and may differ depending on the server.

## Profession Filtering

Profession filtering is enabled by default.

Gather Alee only displays categories related to the professions detected on the current character.

Users can enable:

`Unlock Profession Filter`

to display all supported gathering categories.

## Commands

```text
/ag
/aleegather
/ag hud
/ag radar
/ag guide
/ag reset
/ag import
/ag debug
