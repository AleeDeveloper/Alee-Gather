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

The addon includes node artwork adapted from a user-supplied WotLK GatherMate package; its license is included in `GATHERMATE-LICENSE.txt`. Route-map artwork should only be redistributed publicly when you have permission or an appropriate license from its original creator.

## IMAGES

<img width="913" height="836" alt="Captura de pantalla 2026-10-01 210315" src="https://github.com/user-attachments/assets/80609294-a8c5-42d5-9aaa-e8ee66aab490" />
<img width="830" height="957" alt="Captura de pantalla 2026-10-01 210334" src="https://github.com/user-attachments/assets/ec40102e-8304-492a-9ef8-15074c1536d4" />
<img width="397" height="393" alt="Captura de pantalla 2026-10-01 210345" src="https://github.com/user-attachments/assets/efb017ed-c7fe-4558-baf4-0778749187ef" />
<img width="319" height="284" alt="Captura de pantalla 2026-10-01 210705" src="https://github.com/user-attachments/assets/97a9ab01-9e50-4967-80ac-836af15734db" />
<img width="935" height="621" alt="Captura de pantalla 2026-10-01 210723" src="https://github.com/user-attachments/assets/0dbfe4b1-58c0-4031-867c-0aa6e4cd2408" />
<img width="463" height="314" alt="Captura de pantalla 2026-10-01 210304" src="https://github.com/user-attachments/assets/4af856be-4525-47a6-8bd4-2f417f2e660e" />


