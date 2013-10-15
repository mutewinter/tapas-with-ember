Environment = require 'config/environment'
env = Environment.create()

if env.get('isDevelopment')
  options =
    LOG_TRANSITIONS:                true
    LOG_TRANSITIONS_INTERNAL:       false
    LOG_STACKTRACE_ON_DEPRECATION:  true
    LOG_BINDINGS:                   true
    LOG_VIEW_LOOKUPS:               true
    LOG_ACTIVE_GENERATION:          true

  # From http://git.io/HPjymw
  Ember.RSVP.configure 'onerror', (e) ->
    console.log(e.message)
    console.log(e.stack)

  Ember.debug("Running in #{env.get('name')} environment")
else
  options = {}

module.exports = Ember.Application.create(options)
