# qwant-basic-gl-style

[![Build Status](https://travis-ci.org/QwantResearch/qwant-basic-gl-style.svg?branch=master)](https://travis-ci.org/QwantResearch/qwant-basic-gl-style)

This is the Mapbox GL basemap style used for [Qwant Maps](https://github.com/QwantResearch/QwantMaps).

![preview](https://qwantresearch.github.io/qwant-basic-gl-style/preview/custom.png)

This style uses a vector tile schema adapted from [OpenMapTiles](https://github.com/QwantResearch/OpenMapTiles) (and is mostly compatible with OpenMapTiles).

Check out the [taxonomy chart](https://jawg.github.io/taxonomy/demo/?url=https://raw.githubusercontent.com/QwantResearch/qwant-basic-gl-style/master/style.json).

## Architecture

To mutualize some logic between Qwant Maps components, we use some config files to overwrite a few fields from the GL style template with [our map style builder](https://github.com/QwantResearch/map-style-builder).

Here are the main files of this repo and their usage:

* the `style.json` contains the GL style template. It looks like a regular GL style file but some fields will be overwritten at build time.
* the `tileschema_*.json` files contain the tile schema (in TileJSON format). Mostly useful for debugging purposes.
* the icons repository contains all the map icons. You can build a sprite and an icon-font from them with [our map style builder](https://github.com/QwantResearch/map-style-builder)
* the `i18n.yml` file contains the algorithm to create map in any language (well ... almost any). Most `name` fields specified in the `style.json` will be overwritten at build time with this config
* the `icons.yml` file contains the icons and text color to use for the points of interest. The `text-color` and the icons specified in the `style.json` will be overwritten at build time with this config

## Contribute

Thanks for considering to contribute ! :heart:

If you want to report bugs and make suggestions about Qwant Maps style, please use [Qwant Maps central repository](https://github.com/QwantResearch/QwantMaps) and provide screenshots.

If you know a bit about [Mapbox GL Style format](https://www.mapbox.com/mapbox-gl-js/style-spec) and want to send us some improvements, please read on ;)

You will need to install [Qwant Maps style builder](https://github.com/QwantResearch/map-style-builder).

#### Build

Build the style using our builder:

```npm run build_all -- --style-dir=PATH/TO/YOUR/MAPSTYLE/FOLDER --conf=prod_conf.json --i18n=fr --webfont=true --icons=true
```

Then browse the `build` folder that has been created in your qwant-basic-gl-style folder: it contains
* the generated GL style. If you are not from Qwant, you may want to use the OpenMapTiles version to contribute: `style-omt.json`
* a few debug tools (check out the [map style builder](https://github.com/QwantResearch/map-style-builder) readme to learn more)

#### Test

[Our map style builder](https://github.com/QwantResearch/map-style-builder) can check a few things and give you hints about errors you may have in your style or config files.

`npm test -- PATH/TO/YOUR/MAPSTYLE/FOLDER`


## Our sprite icons

![sprite](https://qwantresearch.github.io/qwant-basic-gl-style/sprite@2x.png)
