# AleeGather v0.98 DEVELOPMENT

## Blizzard button renderer corrected
- Fixed the real cause of the malformed/misaligned Blizzard buttons.
- UI-Panel-Button-Up/Down are atlas textures and must not be stretched using the full 0..1 texture range.
- AleeGather now reproduces Blizzard WotLK's UIPanelButtonTemplate three-piece construction:
  - 12x22-style left cap
  - stretchable middle
  - 12x22-style right cap
- Uses Blizzard's original WotLK texture coordinates for left, middle, right and highlight artwork.
- Normal/pressed state swaps the three Blizzard pieces without moving the Button frame.
- Every existing AleeGather button anchor and size is preserved.
- AleeGather's custom label is centered at the exact logical button center and never receives Blizzard's pushed-text offset.

## Applies globally
- Session Radar / Guide buttons
- Session timer button
- Config buttons
- Guide route/stage buttons
- Guide Close button
- Radar -, +, S-, S+ controls
- Interface Options button

## Preserved
- v0.95 border placement
- themes/backgrounds
- node database behavior
- profession filters
