test 'welcome message present', ->
  visit('/').then ->
    ok find('h2:contains("Welcome to Ember.js")').length

test 'list items present', ->
  visit('/').then ->
    listItems = find('li').length
    equal 3, listItems, "found instead #{listItems}"

test 'environment present', ->
  visit('/').then ->
    ok find('p:contains("test")').length, "has environment"
