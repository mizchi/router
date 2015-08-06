# Router

Router for minimalist

```
npm install @mizchi/router --save
```

for pushstate

```coffee
Router = require '@mizchi/router'
router = new Router
router.route 'users/:name', (params) ->
  console.log params.name

# listening events is your task 

window.addEventListener 'DOMContentLoaded', ->
  router.emit(location.pathname)

window.addEventListener 'pushstate', -> router.emit(location.pathname)
window.addEventListener 'popstate', -> router.emit(location.pathname)
```

for hashchange

```coffee
Router = require '@mizchi/router'
router = new Router(hash: true)
router.route 'users/:name', (params) ->
  console.log params.name

window.addEventListener 'DOMContentLoaded', ->
  router.emit(location.hash)

window.addEventListener 'hashchange', ->
  router.emit(location.hash)
```
