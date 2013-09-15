sysPath = require 'path'

environment = process.env.BRUNCH_ENV ? 'development'

console.log "Running Brunch in #{environment} environment"

exports.config =
  paths:
    watched: ['app', 'test', 'vendor', 'config']
  files:
    javascripts:
      joinTo:
        'javascripts/app.js':
          new RegExp("^(app|config/environments/#{environment}\.coffee)")
        'javascripts/vendor.js':
          new RegExp("^vendor/(scripts|ember/#{environment})")
      order:
        before: [
          'vendor/scripts/console-polyfill.js'
          'vendor/scripts/jquery.js'
          'vendor/scripts/handlebars.js'
          "vendor/ember/#{environment}/ember.js"
          "vendor/ember/#{environment}/ember-data.js"
          "vendor/ember/#{environment}/ember-model.js"
          # Anything else that depends on Ember
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
      order:
        before: ['vendor/stylesheets/normalize.css']

    templates:
      precompile: true
      root: 'templates'
      joinTo: 'javascripts/app.js' : /^app/

  overrides:
    production:
      optimize: true
      sourceMaps: false
      plugins: autoReload: enabled: false
