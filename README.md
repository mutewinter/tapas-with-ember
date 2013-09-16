# Tapas with Ember

A [Brunch][] skeleton for rapid [Ember][] development. Including Ember
installation scripts, environment-specific JS builds, generators, and Rails.vim
support.

## Technology

* [Brunch][]
* [Ember][]
* [Stylus][]
* [Handlebars](http://handlebarsjs.com)
* [HTML5 Boilerplate](http://html5boilerplate.com)
* [Normalize.css](http://necolas.github.io/normalize.css/)
* _Optional_ [Ember Data][]
* _Optional_ [Ember Model][]

## Features

* **Ember Install Script** - [Cakefile scripts](Cakefile) to install the latest
  Ember, Ember Data, and Ember Model.
* **Environments** - Custom code to allow for environment detection
  in the browser and at compile time. Automagically uses Ember's production
  build when in production just like [ember-rails][].
* **Automatic File Loading** - Automatically loads you code, no script tags or
  superfluous requires necessary.
* **[Rails.vim] support** - Navigate to and create models, controllers,
  templates, and views with ease.

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

## Quick Start

Now that you've got Brunch installed, you're three commands away from a running
Ember app!

```bash
brunch new gh:mutewinter/tapas-with-ember <appname>
cd <appname>
cake server
```

Open [`localhost:3333`](http://localhost:3333) and check out your brand new
Ember app! Code changes you make will be automatically loaded in the browser.
Edit [`index_route.coffee`](app/routes/index_route.coffee) to see live-updating
in action.

Tapas with Ember runs Ember 1.0 out of the box. You can update to Beta or
Canary builds using the command below. It's also easy to install the latest
Ember Data or Ember Model using the `cake` scripts below.

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

This skeleton makes use of [scaffolt][] generators to help you create common
files quicker.

To use first install scaffolt globally with `npm install -g scaffolt`. Then you
can use the following command to generate files.

```
scaffolt arraycontroller <name>   →    app/controllers/<name>s_controller.coffee
scaffolt component <name>         →    app/components/<name>_component.coffee
                                       app/templates/components/<name>.hbs
scaffolt controller <name>        →    app/controllers/<name>_controller.coffee
scaffolt helper <name>            →    app/helpers/<name>.coffee
scaffolt initializer <name>       →    app/initializers/<name>.coffee
scaffolt mixin <name>             →    app/mixins/<name>_mixin.coffee
scaffolt model <name>             →    app/models/name.coffee
scaffolt route <name>             →    app/routes/<name>_route.coffee
scaffolt template <name>          →    app/<name>.hbs
scaffolt view <name>              →    app/views/<name>_view.coffee
```

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

## Pow.cx

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
:Rapp               → app/config/app.coffee
:Rasset <name>      → app/assets/<name>
:Rcontroller <name> → app/controllers/<name>_controller.coffee
:Rhelper <name>     → app/helpers/<name>_helper.coffee
:Rinitialize        → app/initialize.coffee
:Rmixin <name>      → app/mixins/<name>.coffee
:Rmodel <name>      → app/models/<name>.coffee
:Rroute <name>      → app/routes/<name>_route.coffee
:Rstylesheet <name> → app/stylesheets/<name>.styl
:Rtemplate <name>   → app/template/<name>.hbs
:Rtest <name>       → test/<name>
:Rview <name>       → app/views/<name>_view.coffee
```

## Thanks To

* [@gcollazo](https://github.com/gcollazo) for making
  [brunch-with-ember-reloaded][], which Tapas with Ember is based on.

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
[scaffolt]: https://github.com/paulmillr/scaffolt


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/mutewinter/tapas-with-ember/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

