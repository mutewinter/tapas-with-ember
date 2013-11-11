require 'initialize'

document.write '<div id="ember-testing"></div>'
App.rootElement = '#ember-testing'
App.setupForTesting()
App.injectTestHelpers()

# Reset the Ember app before each test
QUnit.testStart -> App.reset()
