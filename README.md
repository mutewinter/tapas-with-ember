# Tapas with Ember

A [Brunch][] skeleton for rapid [Ember][] development. Including Ember
installation scripts, environment-specific JS builds, generators, and
[Ember.vim][] support.

<p align="center">
  <a href="http://www.youtube.com/watch?v=BP7lTpNfkyU">
    <img src="http://i.imgur.com/KxXQFtp.png"
    alt="Me talking about Tapas with Ember">
  </a>
</p>

## Technology

* [Brunch][]
* [Ember][]
* [CoffeeScript][]
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
* **[Ember.vim][] support** - Navigate to and create models, controllers,
  templates, and views with ease.

**Brunch Plugins**

* **[digest-brunch][]** - Add a unique SHA to your assets in your production
  build.
* **[auto-reload-brunch][]** - Adds automatic browser reloading support to
  Brunch.
* **[uglify-js-brunch][]** - Adds UglifyJS minification support to Brunch.

## Requirements

Before using Tapas with Ember you will need to install [Node][],
[CoffeeScript][], and [Brunch][].

```
npm install -g brunch coffee
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

Tapas with Ember runs Ember 1.3.1 out of the box. You can update to Beta or
Canary builds using the command below. It's also easy to install the latest
Ember Data or Ember Model using the `cake` scripts below.

## Deploying

Tapas with Ember comes with a [Mina][] [deployment script][].

1. Install Mina by running `gem install mina`
1. Fill in your credentials in [`config/deploy.rb`][deployment script]
1. Run `mina setup`
1. Run `mina deploy`

## Frequently Asked Questions

See [the FAQ][] in the Wiki.

## Updating Libraries

### Install Latest Ember

Tapas with Ember ships with Ember 1.3.1 already installed. You can update to
the latest release from each channel by using the commands below.

```bash
cake ember:install
# cake -t "v1.3.1" ember:install # for v1.3.1 tagged release
# cake -c "beta" ember:install # for beta
# cake -c "canary" ember:install # for canary
```

_Note: `cake ember:list` displays the tagged releases since 1.0.0._

### Install Latest Ember Data Beta

```bash
cake ember-data:install
# cake -t "v1.0.0-beta.4" ember-data:install # for v1.0.0-beta.4 tagged release
# cake -c "canary" ember-data:install # for canary
```

_Note: `cake ember-data:list` displays all tagged releases._

### Install Latest Ember Model

```bash
cake ember-model:install
```

### Install Latest Handlebars

```bash
cake handlebars:install
```

## Generators

This skeleton makes use of [scaffolt][] generators to help you create common
files quicker.

To use first install scaffolt globally with `npm install -g scaffolt`. Then you
can use the following command to generate files.

```
scaffolt arraycontroller <name>   →    app/controllers/<name>s.coffee
scaffolt component <name>         →    app/components/<name>.coffee
                                       app/templates/components/<name>.hbs
scaffolt controller <name>        →    app/controllers/<name>.coffee
scaffolt helper <name>            →    app/helpers/<name>.coffee
scaffolt initializer <name>       →    app/initializers/<name>.coffee
scaffolt mixin <name>             →    app/mixins/<name>.coffee
scaffolt model <name>             →    app/models/name.coffee
scaffolt route <name>             →    app/routes/<name>.coffee
scaffolt router                   →    app/config/router.coffee
scaffolt template <name>          →    app/<name>.hbs
scaffolt view <name>              →    app/views/<name>.coffee
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

To run you will need [Testem](https://github.com/airportyh/testem) and you will
need to install [phantomjs](https://github.com/ariya/phantomjs).

```
brew update && brew install phantomjs
```

To run tests continiously as you write code and tests (for now) you must open
two terminal windows. One running brunch to continiously build the application
and the other running testem.

```
$> cake test # starts brunch in test environment
$> npm test  # starts testem
```

If you want to run your tests on other browsers, modify your `testem.json` file
to include the additional browsers. For example:

```
"launch_in_dev": ["PhantomJS", "Chrome", "Firefox", "Safari"]
```

You can see a list of available launchers by running the command `testem
launchers`.


## Ember.vim Support

Custom [Ember.vim][] support is provided via
[`portkey.json`](/config/projections.json). You can navigate to files via these
commands:

```
:Eadapter
:Easset <name>       → app/assets/<name>
:Ecomponent <name>   → app/components/<name>.coffee
:Econfig <name>      → app/config/<name>.coffee
:Econtroller <name>  → app/controllers/<name>.coffee
:Ehelper <name>      → app/helpers/<name>.coffee
:Einitialize
:Einitializer <name> → app/initializers/<name>.coffee
:Emixin <name>       → app/mixins/<name>.coffee
:Emodel <name>       → app/models/<name>.coffee
:Eroute <name>       → app/routes/<name>.coffee
:Estyle <name>       → app/styles/<name>.styl
:Etemplate <name>    → app/templates/<name>.hbs
:Etest <name>        → test/<name>_test.coffee
:Eutility <name>     → app/utility/<name>.coffee
:Eview <name>        → app/views/<name>.coffee
```

## Updating Tapas with Ember

Tapas with Ember has a built-in update script.

```
cake tapas:update
```

It updates and **overwites** `Cakefile`, `package.json`, `portkey.json`,
`config.coffee`, `generators/*`.

## Thanks To

* [@gcollazo](https://github.com/gcollazo) for making
  [brunch-with-ember-reloaded][], which Tapas with Ember is based on.
* [@cavneb](https://github.com/cavneb) for his excellent contributions via his
  fork, [yet-another-ember-brunch][].


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/mutewinter/tapas-with-ember/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[brunch-with-ember-reloaded]: https://github.com/gcollazo/brunch-with-ember-reloaded
[Stylus]: http://learnboost.github.io/stylus/
[CoffeeScript]: http://coffeescript.org/
[auto-reload-brunch]: https://github.com/brunch/auto-reload-brunch
[Brunch]: http://brunch.io
[Ember]: http://emberjs.com
[uglify-js-brunch]: https://github.com/brunch/uglify-js-brunch
[Ember.vim]: https://github.com/dsawardekar/ember.vim
[Node]: http://nodejs.org/
[ember-rails]: https://github.com/emberjs/ember-rails
[Ember Data]: https://github.com/emberjs/data
[Ember Model]: https://github.com/ebryn/ember-model
[scaffolt]: https://github.com/paulmillr/scaffolt
[the FAQ]: https://github.com/mutewinter/tapas-with-ember/wiki/FAQ
[deployment script]: /config/deploy.rb
[Mina]: http://nadarei.co/mina/
[yet-another-ember-brunch]: https://github.com/cavneb/yet-another-ember-brunch
[digest-brunch]: https://github.com/mutewinter/digest-brunch
