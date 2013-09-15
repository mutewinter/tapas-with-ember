# Require all of the config/environments files. /config.coffee controls which
# environment files will be loaded.
window.require.list().filter (module) ->
  require(module) if new RegExp("^config/environments/").test(module)

module.exports =
  name: window.BRUNCH_ENV ? 'development'
  is: (env) ->
    @name is env
  isDevelopment: -> @is('development')
  isProduction: -> @is('production')
