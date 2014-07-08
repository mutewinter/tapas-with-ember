require 'initialize'

document.write '<div id="ember-testing"></div>'
App.rootElement = '#ember-testing'
App.setupForTesting()

emq.globalize()
setResolver(Ember.DefaultResolver.create(namespace: App))

QUnit.testStart ->
  Ember.run ->
    App.reset()

App.injectTestHelpers()
