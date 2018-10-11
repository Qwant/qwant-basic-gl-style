# qwant-basic-gl-style
a very cool GL style for Qwant Maps

See https://qwantresearch.github.io/qwant-basic-gl-style/ and the [taxonomy chart](https://jawg.github.io/taxonomy/demo/?url=https://raw.githubusercontent.com/QwantResearch/qwant-basic-gl-style/master/style.json)

## Archi

* the `style.json` contains the GL style template
* the `tileschema_*.json` files contain the tile schema in TileJSON format
* the icons repository contains all the map icons. You can build a sprite and an icon-font from them with [the map style builder](https://github.com/QwantResearch/map-style-builder)
* the `i18n.yml` file contains the algorithm to create map in any language (well ... almost any)
* the `icons.yml` file contains the icons and text color to use for the points of interest. If you uses this file in [the map style builder](https://github.com/QwantResearch/map-style-builder), the text-color and the icons specified in the `style.json` will be overwritten


Check out [our map style builder](https://github.com/QwantResearch/map-style-builder) to know more about our build and test process.
