# Tapas with Ember

A [Brunch][] skeleton for rapid [Ember][] development. Including automated
Ember installation scripts, environment-specific JS builds, generators, and
Rails.vim support.

## Technology

* [Brunch][]
* [Ember][]
* [Handlebars](http://handlebarsjs.com)
* [jQuery](http://jquery.com)
* [HTML5 Boilerplate](http://html5boilerplate.com)
* [Normalize.css](http://necolas.github.io/normalize.css/)
* [Stylus][]
* _Optional_ [Ember Data][]
* _Optional_ [Ember Model][]

## Features

* **Ember Install Script** - [Cakefile scripts](Cakefile) to install the latest
  Ember and Ember Data.
* **Environments** - Custom code to allow for environment detection
  in the browser and at compile time. Automagically uses Ember's production
  build when in production just like [ember-rails][].
* **[Rails.vim] support** - Navigate between models and controllers with ease.

**Brunch Plugins**

* **[auto-reload-brunch][]** - Adds automatic browser reloading support to
  Brunch.
* **[uglify-js-brunch][]** - Adds UglifyJS minification support to Brunch.

## Requirements

Before using Tapas with Ember you will need to install [Node][] and
[Brunch][] 1.7 or above.

```
npm install -g brunch
```

## Getting Started

Now you are ready to make your first skeleton.

```bash
brunch new gh:mutewinter/tapas-with-ember <appname>
cd <appname>
```

## Quick Start

Tapas with Ember is ready to go with Ember 1.0 out of the box. Just run `cake
server` and your live-updating server will be running on
[`localhost:3333`](http://localhost:3333).

## Updating Libraries

**Install Latest Ember**

```bash
cake ember:install
# cake -c "beta" ember:install # for beta
# cake -c "canary" ember:install # for canary
```

**Install Latest Ember Data Beta**

```bash
cake ember-data:install
# cake -c "canary" ember:install # for canary
```

**Install Latest Ember Model**

```bash
cake ember-model:install
```

**Install Latest Handlebars**

```bash
cake handlebars:install
```

## Generators

This skeleton makes use of
[scaffolt](https://github.com/paulmillr/scaffolt#readme) generators to help you
create common files quicker. To use first install scaffolt globally with `npm
install -g scaffolt`. Then you can use the following command to generate files.

```
scaffolt arraycontroller <name>   →    app/controllers/names_controller.coffee
scaffolt component <name>         →    app/components/name_component.coffee
                                       app/templates/components/name.hbs
scaffolt controller <name>        →    app/controllers/name_controller.coffee
scaffolt mixin <name>             →    app/mixins/name_mixin.coffee
scaffolt model <name>             →    app/models/name.coffee
scaffolt route <name>             →    app/routes/name_route.coffee
scaffolt template <name>          →    app/templatename.hbs
scaffolt view <name>              →    app/views/name_view.coffee
```

There are more commands you can do with scaffolt and also instruction on how to
create your own generators, so make sure you check out the
[docs](https://github.com/paulmillr/scaffolt#readme).

## Compiling for Production

Both the development and production versions of [Ember][] are installed via
the `ember:install` cake task. To compile your project with the production
version of Ember, run the following command:

`cake build`

## Scripts

The following [`cake`](/Cakefile) scripts are provided.

```
cake server               # start the brunch server in development
cake build                # build for production (delete public folder first)
cake ember:install        # install latest Ember
cake ember-data:install   # install latest Ember Data
cake ember-model:install  # install latest Ember Model
cake handlebars:install   # install latest Handlebars
```

## Pox.cx

To use this app with [Pow.cx](http://pow.cx/), follow these simple steps:

1. Install [Pow.cx](http://pow.cx/)
1. `echo 3333 > ~/.pow/<appname>`
1. Start the server with `cake server`
1. Open [tapas-with-ember.dev](http://<app-name>.dev)


## Testing

To run you will need [Karma](https://github.com/karma-runner) you will need to
install [phantomjs](https://github.com/ariya/phantomjs). If you want to run
your tests on other browsers consult the Karma docs.

```
brew update && brew install phantomjs
```

To run tests continiously as you write code and tests (for now) you must open
two terminal windows.

```
brunch watch -s
```

```
karma start
```

## Vim Users

A [`projections.json`](/config/projections.json) file is specified for
[Rails.vim][] support. You can navigate to files via these commands:

```
Rapp               → app/config/app.coffee
Rasset <name>      → app/assets/<name>
Rcontroller <name> → app/controllers/<name>_controller.coffee
Rhelper <name>     → app/helpers/<name>_helper.coffee
Rinitialize        → app/initialize.coffee
Rmixin <name>      → app/mixins/<name>.coffee
Rmodel <name>      → app/models/<name>.coffee
Rroute <name>      → app/routes/<name>_route.coffee
Rstylesheet <name> → app/stylesheets/<name>.styl
Rtemplate <name>   → app/template/<name>.hbs
Rtest <name>       → test/<name>
Rview <name>       → app/views/<name>_view.coffee
```

## Thanks To

* @gcollazo for making [brunch-with-ember-reloaded][], which tapas-with-ember
  is based on.

## License

All of brunch-with-tapas is licensed under the MIT license.

Copyright © 2013 Jeremy Mack

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[brunch-with-ember-reloaded]: https://github.com/gcollazo/brunch-with-ember-reloaded
[Stylus]: http://learnboost.github.io/stylus/
[CoffeeScript]: http://coffeescript.org/
[auto-reload-brunch]: https://github.com/brunch/auto-reload-brunch
[Brunch]: http://brunch.io
[Ember]: http://emberjs.com
[uglify-js-brunch]: https://github.com/brunch/uglify-js-brunch
[Rails.vim]: https://github.com/tpope/vim-rails
[Node]: http://nodejs.org/
[ember-rails]: https://github.com/emberjs/ember-rails
[Ember Data]: https://github.com/emberjs/data
[Ember Model]: https://github.com/ebryn/ember-model
