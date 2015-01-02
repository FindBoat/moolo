config =
  appTitle: 'Moolo'
  version: '0.0.1'

configure = (
  $httpProvider,
  $locationProvider,
  $routeProvider,
  routehelperConfigProvider
) ->
  $locationProvider.hashPrefix '!'

  routehelperConfigProvider.config.$routeProvider = $routeProvider
  routehelperConfigProvider.config.docTitle = 'Moolo | '

  $httpProvider.interceptors.push 'ErrorInterceptor'
  $httpProvider.interceptors.push 'TokenInterceptor'

  # Maybe set resolveAlways here.
  return

configure.$inject = [
  '$httpProvider'
  '$locationProvider'
  '$routeProvider'
  'routehelperConfigProvider'
]

angular
  .module 'app.core'
  .value 'config', config
  .config configure

