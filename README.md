# Tapas with Ember [![Build Status][travis-badge]][travis]

A [Brunch][] skeleton for rapid [Ember][] development. Including Ember
installation scripts, environment-specific builds, generators, and
[Ember.vim][] support.

<p align="center">
  <a href="http://www.youtube.com/watch?v=BP7lTpNfkyU">
    <img src="http://i.imgur.com/KxXQFtp.png"
    alt="Me talking about Tapas with Ember">
  </a>
</p>

- [Features](#features)
- [Setup](#setup)
- [Testing](#testing)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Technology](#technology)
- [Updating Libraries](#updating-libraries)
    - [Ember](#install-latest-ember)
    - [Ember Data](#install-latest-ember-data-beta)
    - [Ember Model](#install-latest-ember-model)
- [Generators](#generators)
- [Compiling for Production](#compiling-for-production)
- [Deploy](#deploy)
- [Scripts](#scripts)
- [Pow.cx](#powcx)
- [Ember.vim Support](#embervim-support)
- [Updating Tapas with Ember](#updating-tapas-with-ember)
- [Thanks To](#thanks-to)

## Features

* **Ember Install Script** - [Cakefile scripts](Cakefile) to install the latest
  Ember, Ember Data, and Ember Model.
* **Environments** - Custom code to allow for environment detection
  in the browser and at compile time. Automatically uses Ember's production
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

## Setup

Before using Tapas with Ember you will need to install [Node][],
[CoffeeScript][], [Brunch][], and [Bower][].

```
npm install -g brunch coffee-script bower
```

Now that you've got Brunch installed, you're three commands away from a running
Ember app!

```bash
brunch new gh:mutewinter/tapas-with-ember <appname>
cd <appname>
cake server
```

Open [`localhost:7435`](http://localhost:7435) and check out your brand new
Ember app! Every time you save a file, the browser will automatically refresh.

Tapas with Ember runs the latest release channel Ember and latest beta of Ember
Data. You can update to Beta or Canary builds using `cake ember:install`. It's
also easy to install the latest Ember Data or Ember Model using the `cake`
scripts below.

## Testing

To run run tests headlessly you'll need need to install
[phantomjs](https://github.com/ariya/phantomjs).

```
brew update && brew install phantomjs
```

### Running Tests Once

```
npm test
```

This command will install all dependencies, build the application in the test
environment, and run the tests.

### Running Tests Automatically

In two terminal sessions, run these commands:

```
npm run-script test:watch
cake test:watch
```

Testem will now rerun tests every time your app code changes. You can switch
`test:watch` to `test:server` if you'd also like to manually interact with the
app on <http://localhost:7435>.

### Testing in Other Browsers

If you want to run your tests on other browsers, modify your `testem.yml` file
to include the additional browsers. For example:

```
launch_in_dev: ['PhantomJS', 'Chrome', 'Firefox', 'Safari']
```

You can see a list of available launchers by running the command `testem
launchers`.


## Frequently Asked Questions

See [the FAQ][] in the Wiki for answers to questions like:

* How do I add a JavaScript / CSS Library?
* How do I add [Bootstrap](http://getbootstrap.com/)?
* How do I detect the environment?
* How do I set Ember feature flags?

## Technology

* [Ember 1.6.1][Ember]
* [Ember Data 1.0.0-beta.8][Ember Data]
* [Brunch 1.7.13][Brunch]
* [Bower](http://bower.io)
* [Handlebars 1.3.0][Handlebars]
* [jQuery 1.11.0](http://jquery.com)
* [CoffeeScript 1.7.1][CoffeeScript]
* [Stylus][]
* [HTML5 Boilerplate](http://html5boilerplate.com)
* [Normalize.css](http://necolas.github.io/normalize.css/)
* _Optional_ [Ember Model][]

[![NPM Dependency Status][gemnasium-i]][gemnasium] _This will always say out of
date because I'm using jQuery 1.X for IE compatibility._

## Updating Libraries

### Ember

Tapas with Ember ships with the latest release channel Ember. You can install
other versions of Ember using the commands below.

```bash
cake ember:install
# cake -t "v1.6.1" ember:install # for v1.6.1 tagged release
# cake -c "beta" ember:install # for beta
# cake -c "canary" ember:install # for canary
```

_Note: `cake ember:list` displays the tagged releases since 1.0.0._

### Ember Data

```bash
cake ember-data:install
# cake -t "v1.0.0-beta.8" ember-data:install # for v1.0.0-beta.8 tagged release
# cake -c "canary" ember-data:install # for canary
```

_Note: `cake ember-data:list` displays all tagged releases._

### Ember Model

```bash
cake ember-model:install
```

_Note: Ember Model can not be used with Ember Data._

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
scaffolt template <name>          →    app/template/<name>.hbs
scaffolt view <name>              →    app/views/<name>.coffee
```

## Compiling for Production

Both the development and production versions of [Ember][] are installed via
the `ember:install` cake task. To compile your project with the production
version of Ember with [hashed file names][digest-brunch], run:

`cake build`

Now the `public` folder will contain your production-ready Ember app.

## Deploy

Tapas with Ember comes with a [Mina][] [deployment script][] to deploy your app
to your own server.

1. Install Mina by running `gem install mina`
1. Fill in your credentials in [`config/deploy.rb`][deployment script]
1. Setup your server, I use [Nginx][] with [this config][nginx config]
1. Run `mina setup`
1. Run `mina deploy`

## Scripts

The following [`cake`](/Cakefile) scripts are provided.

```
cake server               # start the brunch server in development
cake watch                # build the app continuously without a server
cake build                # build for production
cake build:test           # build for test
cake test:watch           # run brunch in test environment and watch for changes
cake test:server          # run brunch in test environment, watch for changes, and run server
cake tapas:update         # update Tapas to latest (Cakefile, package.json, portkey.json, config.coffee, generators/*)
cake ember:install        # install latest Ember
cake ember:list           # list tagged relases of Ember since v1.0.0
cake ember-data:install   # install latest Ember Data
cake ember-data:list      # list tagged relases of Ember Data
cake ember-model:install  # install latest Ember Model
```

The following `npm` scripts are provided

```
npm test                  # Install dependencies, build for test, run tests
npm run-script test:watch # Run tests continuously when files change
```

## Pow.cx

To use this app with [Pow.cx](http://pow.cx/), follow these simple steps:

1. Install [Pow.cx](http://pow.cx/)
1. `echo 7435 > ~/.pow/<appname>`
1. Start the server with `cake server`
1. Open <http://appname.dev>

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
:Eutility <name>     → app/utilities/<name>.coffee
:Eview <name>        → app/views/<name>.coffee
```

## Updating Tapas with Ember

Tapas with Ember has a built-in update script.

```
cake tapas:update
```

It updates and **overwrites** `Cakefile`, `package.json`, `portkey.json`,
`config.coffee`, `generators/*`.

## Thanks To

* [@gcollazo](https://github.com/gcollazo) for making
  [brunch-with-ember-reloaded][], which Tapas with Ember is based on.
* [@cavneb](https://github.com/cavneb) for his excellent contributions via his
  fork, [yet-another-ember-brunch][].


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
[Bower]: http://bower.io
[Handlebars]: http://handlebarsjs.com
[Nginx]: http://nginx.org/
[nginx config]: https://github.com/mutewinter/tapas-with-ember/wiki/nginx
[gemnasium]: https://gemnasium.com/mutewinter/tapas-with-ember
[gemnasium-i]: http://img.shields.io/gemnasium/mutewinter/tapas-with-ember.svg?style=flat
[travis]: https://travis-ci.org/mutewinter/tapas-with-ember
[travis-badge]: https://img.shields.io/travis/mutewinter/tapas-with-ember.svg?style=flat
