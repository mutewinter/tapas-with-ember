# Require all of the config/environments files. /config.coffee controls which
# environment files will be loaded.
window.require.list().filter (module) ->
  require(module) if new RegExp("^config/environments/").test(module)

Environment = Ember.Object.extend
  isTest: Ember.computed.equal('name', 'test')
  isDevelopment: Ember.computed.equal('name', 'development')
  isProduction: Ember.computed.equal('name', 'production')

module.exports = Environment.create(window.TAPAS_ENV)
