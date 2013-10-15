# Require all of the config/environments files. /config.coffee controls which
# environment files will be loaded.
window.require.list().filter (module) ->
  require(module) if new RegExp("^config/environments/").test(module)

module.exports = Ember.Object.extend
  name: window.BRUNCH_ENV ? 'development'

  isDevelopment: (->
    @get('name') is 'development'
  ).property('name')

  isProduction: (->
    @get('name') is 'production'
  ).property('name')
