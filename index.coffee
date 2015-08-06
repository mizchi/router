pathToRegexp = require('path-to-regexp')
module.exports =
class Router
  constructor: (opts = {}) ->
    @hash = opts.hash ? false
    @_routes = []

  route: (path, callback) ->
    header = if @hash then '#' else '/'
    regexp = pathToRegexp(header + path)

    @_routes.push {regexp, callback}
    @
    
  emit: (path) =>
    for r in @_routes
      if m = r.regexp.exec path
        match = {}
        for key, n in r.regexp.keys
          match[key.name] = m[n+1]
        r.callback(match)
        break

