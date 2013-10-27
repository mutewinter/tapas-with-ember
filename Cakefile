http = require 'http'
https = require 'https'
fs = require 'fs'
path = require 'path'
{spawn, exec} = require 'child_process'
semver = require 'semver'

# ----------------
# Server / Builder
# ----------------

option '-P', '--production', 'run server in production mode'

LOCAL_BRUNCH = path.join('.', 'node_modules', '.bin', 'brunch')

spawnBrunch = (flags, env) ->
  if fs.existsSync(LOCAL_BRUNCH)
    brunch = spawn LOCAL_BRUNCH, flags, env
  else
    console.error 'Warning, using global brunch. Run `npm install`.'
    brunch = spawn 'brunch', flags, env

  brunch.stdout.on 'data', (data) -> console.log data.toString().trim()
  brunch.stderr.on 'data', (data) -> console.log data.toString().trim()


task 'server', 'start the brunch server in development', (options) ->
  flags = ['w', '-s']
  if options.production?
    flags.push('-P')
    process.env.BRUNCH_ENV = 'production'
  spawnBrunch flags, process.env

task 'build', 'build for production (delete public folder first)', ->
  exec('rm -rf ./public')
  process.env.BRUNCH_ENV = 'production'
  spawnBrunch ['b', '-P'], process.env

# ------------
# Installation
# ------------

EMBER_BASE_URL = 'http://builds.emberjs.com'
EMBER_GITHUB_API_URL = 'https://api.github.com/repos/emberjs/ember.js/tags'
EMBER = {}
EMBER_DATA = {}
['release', 'beta', 'canary'].forEach (build) ->
  EMBER[build] =
    prod: "#{EMBER_BASE_URL}/#{build}/ember.prod.js"
    dev: "#{EMBER_BASE_URL}/#{build}/ember.js"
  EMBER_DATA[build] =
    prod: "#{EMBER_BASE_URL}/#{build}/ember-data.prod.js"
    dev: "#{EMBER_BASE_URL}/#{build}/ember-data.js"

EMBER['tag'] =
  prod: "#{EMBER_BASE_URL}/tags/{{tag}}/ember.prod.js"
  dev: "#{EMBER_BASE_URL}/tags/{{tag}}/ember.js"

downloadFile = (src, dest) ->
  file = fs.createWriteStream(dest)
  request = http.get src, (response) ->
    response.pipe file

downloadEmberFile = (src, dest) ->
  downloadFile(src, "vendor/ember/#{dest}")

# Channel
option '-c', '--channel "[CHANNEL_NAME]"',
  'relase, beta, or canary (http://emberjs.com/builds)'

# Tag
option '-t', '--tag "[TAG_NAME]"',
  'a tagged release to install. Run cake ember:list to see known tags'

# Ember
task 'ember:install', 'install latest Ember', (options) ->
  if 'tag' of options
    # Download a Tag
    tag = options.tag
    downloadEmberFile(EMBER['tag'].dev.replace(/{{tag}}/, tag),
      'development/ember.js')
    downloadEmberFile(EMBER['tag'].prod.replace(/{{tag}}/, tag),
      'production/ember.js')
  else
    # Download a Channel
    channel = options.channel ? 'release'
    downloadEmberFile EMBER[channel].dev, 'development/ember.js'
    downloadEmberFile EMBER[channel].prod, 'production/ember.js'

task 'ember:list', 'list tagged relases of Ember since v1.0.0', (options) ->
  request = https.get EMBER_GITHUB_API_URL, (response) ->
    data = ''
    response.on 'data', (chunk) -> data += chunk
    response.on 'end', ->
      tags = JSON.parse(data)
      console.log 'Tagged Ember Releases:'
      for tag in tags
        if semver.valid(tag.name) and !semver.lt(tag.name, 'v1.0.0')
          console.log "  #{tag.name}"
      console.log 'Install with cake -t "v1.0.0" ember:install'

# Ember
task 'ember-data:install', 'install latest Ember Data', (options) ->
  channel = options.channel ? 'beta'
  downloadEmberFile EMBER_DATA[channel].dev, 'development/ember-data.js'
  downloadEmberFile EMBER_DATA[channel].prod, 'production/ember-data.js'

# Ember Model
EMBER_MODEL =
  dev: 'http://builds.erikbryn.com/ember-model/ember-model-latest.js'
  prod: 'http://builds.erikbryn.com/ember-model/ember-model-latest.prod.js'

task 'ember-model:install', 'install latest Ember Model', (options) ->
  downloadEmberFile EMBER_MODEL.dev, 'development/ember-model.js'
  downloadEmberFile EMBER_MODEL.prod, 'production/ember-model.js'

# Handlebars
task 'handlebars:install', 'install latest Handlebars', (options) ->
  downloadFile(
    'http://builds.handlebarsjs.com.s3.amazonaws.com/handlebars-latest.js',
    'vendor/scripts/handlebars.js'
  )
