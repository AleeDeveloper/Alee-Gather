# Gather Alee (AleeGather) — WotLK 3.3.5a

A lightweight standalone gathering tracker made for the original World of Warcraft: Wrath of the Lich King 3.3.5a client (Interface 30300), with Warmane compatibility as a primary target.

## Features

- World Map gathering-node pins.
- Minimap gathering-node pins.
- Farming radar with adjustable range, size and opacity.
- Manual farming sessions with timer, total loot count and per-category counters.
- Gathering counters continue while the session timer is paused.
- Automatic profession detection for Mining, Herbalism, Fishing, Engineering gas clouds and Skinning.
- Profession filtering enabled by default, with an optional unlock setting.
- Mining, Herbalism and Skinning leveling guides with skill brackets, suggested zones and route maps.
- Skinning guide includes route-specific target-beast descriptions.
- Guide closes with ESC.
- Separate opacity controls for World Map, Minimap, Radar and Guide.
- Local learned-node database shared across characters through `AleeGatherDB`.
- Adaptive local respawn estimation for previously gathered nodes.
- Optional import from compatible WotLK `GatherMate_Data`.
- English, Spanish (Spain) and Spanish (LatAm/Mexico) localization.
- No Ace3 dependency.

## Commands

- `/ag` — Open settings.
- `/ag guide` or `/ag guia` — Open the gathering guide.
- `/ag radar` — Toggle radar.
- `/ag hud` — Toggle the session HUD.
- `/ag reset` — Reset the current session.
- `/ag import` — Import a compatible GatherMate_Data database.
- `/ag debug` — Toggle debug output.

## Installation

1. Extract the `AleeGather` folder into `World of Warcraft/Interface/AddOns/`.
2. Make sure the final path is `Interface/AddOns/AleeGather/AleeGather.toc`.
3. Enable **Load out of date AddOns** only if your 3.3.5a client requires it.

## WotLK limitation

WoW 3.3.5a does not expose a complete live server API telling addons whether every saved gathering node is currently spawned. Gather Alee therefore uses local observations and respawn estimates. Seeing or interacting with the real node updates its local state immediately.

## Saved data

Gather Alee uses the account-wide SavedVariable `AleeGatherDB`, so learned node positions and addon settings can be reused by other characters on the same WoW account.

## Credits / third-party assets

AleeGather's original source code and original project assets are covered by `ALEEGATHER-LICENSE.txt`. Third-party materials are documented separately in `THIRD-PARTY-NOTICES.txt`, with the original GatherMate license preserved in `GATHERMATE-LICENSE.txt`.
