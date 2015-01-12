RouteConfig = ($location, $rootScope, authService, logger) ->
  checkLogin = ->
    $rootScope.$on '$routeChangeStart', (event, next, current) ->
      if next.loginRequired and not authService.isLogin()
        destination = (next and (next.title or next.name or
            next.loadedTemplateUrl)) or 'unknown target'
        logger.warning 'Login required for ' + destination, [next]
        $location.path '/'

      if next.logoutRequired and authService.isLogin()
        destination = (next and (next.title or next.name or
            next.loadedTemplateUrl)) or 'unknown target'
        logger.warning 'Logout required for ' + destination, [next]
        $location.path '/journal'

  init = ->
    checkLogin()

  init()
  return

RouteConfig.$inject = ['$location', '$rootScope', 'authService', 'logger']
angular
  .module 'app.core'
  .run RouteConfig
