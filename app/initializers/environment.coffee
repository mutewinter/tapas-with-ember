Environment = require 'config/environment'

module.exports = Ember.Application.initializer
  name: 'environment'

  initialize: (container, application) ->
    application.register('environment:main', Environment, singleton: true)
    application.inject('controller', 'env', 'environment:main')
