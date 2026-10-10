# AleeGather — WotLK 3.3.5a / Warmane

Native standalone gathering tracker for the original WoW 3.3.5a client (build 12340).

## v0.3 highlights
- Per-node artwork imported from the user-supplied WotLK GatherMate package:
  - individual ore textures (Copper, Tin, Iron, Mithril, Thorium, Cobalt, Saronite, Titanium...)
  - individual herb textures
  - fishing pool, gas cloud, and treasure textures
- Green/red status ring around each node:
  - Green = known node / not harvested by you recently
  - Red = harvested by you recently and treated as probably depleted
  - The red timeout is configurable (1–15 min)
- World-map pins, minimap pins, and farming radar all use the same node artwork/status.
- Safer collector:
  - Smelting is no longer treated as Mining.
  - A node is saved only after a gathering interaction is followed by LOOT_OPENED.
  - Error messages no longer create new database coordinates.
- Farming radar + farming session HUD.
- Interface configuration under Esc -> Interface -> AddOns -> AleeGather.
- English, Spanish (Spain), Spanish (Mexico/LatAm).
- No Ace3 dependency.

## Important limitation of WoW 3.3.5a
The old client does not expose a complete API telling an addon whether every database node is currently spawned on the server.
AleeGather therefore uses the status ring as a practical local state:
green = known/not recently harvested; red = recently harvested by you.
Seeing/interacting with the actual world object immediately resets that point to green.

## Commands
/ag
/ag radar
/ag hud
/ag reset
/ag import
/ag debug

## Importing a full 3.3.5a database
AleeGather can import the classic GatherMate_Data globals directly.
The GatherMate addon itself does not have to work: if GatherMate_Data is installed, `/ag import`
tries to load it and copies compatible points into AleeGather's own SavedVariables.

## Artwork attribution
The per-node TGA artwork and original GatherMate icon/track texture in this build were taken
from the GatherMate package supplied by the user for this conversion. The accompanying
GatherMate license is included as GATHERMATE-LICENSE.txt.


## v0.4 additions
- Session HUD buttons: Pause/Resume, Reset, Radar toggle.
- Clickable category icons in the session HUD to show/hide Herb, Mining, Fishing, Gas and Treasure.
- Automatic profession detection from the 3.3.5a skill lines.
- Optional automatic profession filter: Herbalism shows herbs, Mining shows ore, Fishing shows pools, Engineering shows gas; Treasure stays available.
- Profession icons and current skill ranks are shown in the session HUD.
- Green status now explicitly means known / estimated available; it is not a live server spawn check.

## v0.5
- Radar orientation now mirrors the actual minimap orientation.
- Radar zoom +/- controls.
- Radar window size S-/S+ controls.
- World map/minimap/radar pins use interactive buttons with higher frame level for reliable tooltips.
- Tooltips show node name and required gathering level.
- Session category buttons use real representative gathering-node artwork.
- Farming radar session button widened so localized text does not overflow.

## v0.6
- World-map pins promoted to a reliable interactive layer for mouse tooltips.
- Map/minimap/radar tooltip: node name + required gathering level.
- Session Mining button now uses the pickaxe profession icon.
- Added lightweight in-game Mining/Herbalism guide (`/ag guide`).
- Guide automatically detects profession skill and recommends the current bracket, node types and zones.
- Radar player arrow now uses AleeGather's own north-facing 2D arrow, avoiding the 3.3.5a MinimapArrow model offset.
- Radar arrow follows fixed/rotating minimap behavior.

## v0.7
- Fixed radar player-arrow direction to match the 3.3.5a minimap.
- Radar performance pass: arrow updates independently at 10 Hz; node scan/placement at 4 Hz.
- Radar only recalculates arrow texture coordinates when facing changes meaningfully.
- Compact session HUD restored; Guide is now a small `G` button with tooltip.
- Removed obsolete radar-sync option and related dead configuration code.
- Restored `/ag guide` and `/ag guia` command routing.
- General cleanup for a future public release.

## v0.8
- Radar player arrow removed; a fixed center dot is used instead.
- Session button simplified to `Radar`.
- Removed radar-arrow update work entirely.
- Config window lower section reorganized to avoid overlapping labels/controls.
- Minimap button now respects external button collectors: if another addon reparents it, AleeGather stops repositioning it.
- Added a generic world-map cursor proximity tooltip fallback for Leatrix Maps and similar map addons that intercept mouse input.

## v0.9
- Removed unintended white status-ring artifacts from recycled pins.
- Status rings are now strictly green (available/estimated) or black (depleted/local state).
- When status rings are disabled, no ring texture is rendered at all.
- World-map hover now uses cursor coordinates relative to WorldMapButton instead of pin mouse events, improving compatibility with Leatrix Maps.

## v0.12
- Minimap rendering reverted to the v0.9 update model; v0.10/v0.11 zoom/pool experiments removed.
- Minimap node pins are now plain Frames instead of Buttons to avoid DragonflightUI/MBB-style automatic button borders.
- Node TGA alpha was cleaned to remove low-alpha square haze from legacy GatherMate artwork.
- Minimap node size is fixed at 16 px × configured scale.
- Status rings use separate baked green/black textures; no white status texture is used.

## v0.14
- Removed all Leatrix Maps-specific world-map hover compatibility.
- World-map pins are display-only and never capture mouse input.
- Fixed map browsing: AleeGather no longer calls SetMapToCurrentZone while the world map is open.
- Player position is cached while browsing other zones, restoring normal right-click region/continent navigation.

## v0.15
- Added a proof-of-concept image-based route section to the in-game gathering guide.
- Mining 1-64 now includes route map examples for Durotar and Elwynn Forest.
- Guide window expanded and route buttons added.
- Other skill ranges continue to use the lightweight text guide until more route maps are added.

## v0.16
- Added mining route images for all major skill ranges from 1-450.
- Guide now shows route-map buttons for Classic, Outland and Northrend mining progression.
- Herbalism remains text-only for now.

## v0.17
- Reprocessed all guide route images as 512x256 RGBA TGA textures for WoW 3.3.5a compatibility.
- Improved route guide layout and map display area.
- Added Previous/Next route navigation and selected-route counter.
- Session HUD now shows localized Guide/Guía instead of the single-letter G button.

## v0.18
- Polished the Mining guide layout.
- Route image viewport now uses an exact 2:1 aspect ratio matching the 512x256 route textures.
- Image is centered at 640x320 with a uniform border and no stretching.
- Guide window is taller so the route image, footer and Close button no longer overlap.
- Mining route system otherwise unchanged.

## v0.19
- Moved the guide footnote lower so it no longer touches the route image area.

## v0.20
- Guide node list now shows the required profession level for each displayed node.
- Nudged the guide footnote slightly upward to keep it away from the bottom border.

## v0.21
- Added previous/next level-range arrows to the guide so you can browse other progression stages manually.
- Guide now shows a stage pager (for example 2/10) in the upper-right area.

## v0.22
- Moved the guide stage arrows and route arrows away from the right frame border for cleaner spacing.

## v0.23
- Gathering sessions no longer start automatically on login.
- Added Start/Iniciar state; the timer and gathering counters begin only when the user starts a session.
- Reset now returns the session to an inactive 00:00:00 state.
- Session HUD widened and realigned, including a fixed right-aligned timer and better button spacing.

## v0.24
- Restyled the Session HUD and Radar with WoW dialog-style borders to match the guide window.
- Added a gear/settings button beside the Guide button in the Session HUD.
- Improved Session HUD spacing for title, timer, lines, and bottom buttons.

## v0.25
- Session HUD made compact again while retaining the WoW dialog border.
- Replaced the red settings button with the native WoW UI-OptionsButton gear icon.
- Rebalanced timer, profession line, category rows and bottom controls.

## v0.26
- Restored the compact Session HUD with the same WoW dialog border style as the Guide.
- Moved the session timer farther inward from the right frame edge.
- Added a bundled WoW-style gear texture based on the provided reference so the settings button is always visible.

## v0.27
- Fixed the Session HUD settings gear to use a bundled WoW-style icon texture that always renders.
- Moved the session timer farther inward from the right edge.
- Restyled the Session HUD and Radar borders to match the guide window while keeping the Session panel compact.

## v0.29
- Gathering Guide can now be closed with ESC.
- Added a persistent guide opacity slider from 35% to 100%.

## v0.30 experimental
- Corrected guide opacity control layout; endpoint labels are hidden and a single live percentage is shown.
- Minimap nodes now dim while locally estimated depleted. Default gathered opacity: 30%.
- Added a Settings slider for gathered-node minimap opacity.
- Added adaptive respawn learning: when a previously gathered real node is seen/interacted with again, AleeGather records the observed interval and uses the shortest confirmed observation for future estimates of that node type.
- Seeing/interacting with the real node always restores full opacity immediately.

## v0.31
- Removed the opacity slider from inside the Gathering Guide.
- Guide opacity is now controlled only from Settings.
- Removed the "gathered minimap opacity" control from Settings; depleted nodes still use the internal 30% state.
- Added independent World Map opacity control.
- Kept Minimap opacity independent from World Map opacity.
- Kept the experimental adaptive respawn learning system from v0.30.

## v0.32
- Session counters now use the real quantities from the gathering loot window.
- Mining, Herbalism, Fishing, Gas and Treasure sessions count gathered items instead of only +1 per node.
- Session counters still intentionally stop while the session is paused.

## v0.33
- Session timer pause now freezes only time; gathering item counters continue.
- Loot counting uses real stack quantities with a 3.3.5a loot-window + localized CHAT_MSG_LOOT fallback.
- Added Skinning/Desuello to profession detection, Settings and the Session HUD. Skinning is session-only because corpses are dynamic and are not persistent world nodes.
- Increased Session HUD height and moved the Last line so it is no longer hidden by the buttons.

## v0.34
- Gas Clouds are now labeled correctly as an Engineering gathering resource, not as a standalone profession.
- Profession HUD shows Engineering; counters/filters show Gas Clouds (Engineering).
- Internal category remains "Extract Gas" for compatibility with existing learned/imported data.

## v0.35
- Added the Skinning icon to the Session HUD.
- Profession filtering is now locked by default.
- Added an optional Settings checkbox to unlock the profession filter; it is disabled by default.

## v0.38
- Restored the original known-good Guide logic from v0.35.
- Kept Mining guide data untouched.
- Added Herbalism route maps only, using valid WotLK texture paths.
- Fixed the Guide button regression from v0.37.

## v0.39
- Added full Skinning guide support with route images for WotLK 1-450.
- Each Skinning route now includes a brief description above the image explaining which beasts to kill.
- Added Skinning profession detection to the Guide window.
- Added a special Targets label for Skinning guide stages.

## v0.40
- Fixed Spanish Skinning detection: "Desollar" is now recognized correctly.
- Profession detection now accepts multiple WotLK 3.3.5a English/Spanish aliases.
- Added tolerant profession-name matching for custom/localized clients.
- Updated Interface Options profession-filter setting to the current unlock-filter behavior.
