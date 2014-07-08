moduleFor 'route:index', 'Unit: route/index'

test 'Model is expected array of colors', ->
  expect 1

  # with moduleFor, the subject returns an instance of the route
  route = @subject()

  deepEqual(route.model(), ['red', 'yellow', 'blue'])
