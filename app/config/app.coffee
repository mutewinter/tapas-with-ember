env = require 'config/environment'

if env.get('isDevelopment')
  options =
    LOG_TRANSITIONS:                true
    LOG_TRANSITIONS_INTERNAL:       false
    LOG_STACKTRACE_ON_DEPRECATION:  true
    LOG_BINDINGS:                   true
    LOG_VIEW_LOOKUPS:               true
    LOG_ACTIVE_GENERATION:          true

  Ember.RSVP.configure 'onerror', (error) ->
    Ember.Logger.error(error?.message or 'No error message for Promise')
    Ember.Logger.error(error?.stack)
    Ember.Logger.error(error?.object)

  # Log view render times to the console
  Ember.STRUCTURED_PROFILE = true

  Ember.Logger.debug(
    "Running in the %c#{env.get('name')}%c environment", 'color: red;', ''
  )
else
  options = {}

module.exports = Ember.Application.create(options)
