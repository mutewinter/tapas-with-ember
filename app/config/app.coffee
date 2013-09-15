env = require 'config/environment'

if env.isDevelopment()
  options =
    LOG_TRANSITIONS:                true
    LOG_TRANSITIONS_INTERNAL:       false
    LOG_STACKTRACE_ON_DEPRECATION:  false
    LOG_BINDINGS:                   false
    LOG_VIEW_LOOKUPS:               true
    LOG_ACTIVE_GENERATION:          false

  # From http://git.io/HPjymw
  Ember.RSVP.configure 'onerror', (e) ->
    console.log(e.message)
    console.log(e.stack)

  Ember.debug("Running in #{env.name} environment")
else
  options = {}

module.exports = Ember.Application.create(options)
