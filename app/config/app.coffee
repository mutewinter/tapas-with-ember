env = require 'config/environment'

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
    Ember.Logger.error(e.message)
    Ember.Logger.error(e.stack)

  Ember.Logger.debug(
    "Running in the %c#{env.get('name')}%c environment", 'color: red;', ''
  )
else
  options = {}

module.exports = Ember.Application.create(options)
