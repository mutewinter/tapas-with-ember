# Require all of the config/environments files. /config.coffee controls which
# environment files will be loaded.
window.require.list().filter (module) ->
  require(module) if new RegExp("^config/environments/").test(module)

Environment = Ember.Object.extend
  isDevelopment: (->
    @get('name') is 'development'
  ).property('name')

  isProduction: (->
    @get('name') is 'production'
  ).property('name')

module.exports = Environment.create(window.TAPAS_ENV)
