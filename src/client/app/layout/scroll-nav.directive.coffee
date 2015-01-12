scrollNav = ($location, $rootScope, $timeout, authService) ->
  restrict: 'A'
  templateUrl: '/client/app/layout/nav.jade'
  link: ($scope, $element, $attr) ->
    nav = $element.find 'nav'
    brand = $element.find '.navbar-brand'

    init = ->
      $scope.isLogin = authService.isLogin()
      if !$scope.isLogin
        nav.removeClass 'nav-hide'
      else
        nav.addClass 'nav-hide'
    init()

    # Update login status when route changes.
    $rootScope.$on '$routeChangeStart', (event, cur, prev) -> init()

    $scope.onMouseover = ->
      nav.removeClass 'nav-hide'
      return

    $scope.onMouseleave = ->
      if $scope.isLogin then nav.addClass 'nav-hide'
      return

    $scope.logout = ->
      authService.logout()
      $location.path '/'

    removeShake = ->
      brand.removeClass 'shake'
      return
    $timeout removeShake, 600 


angular
  .module 'app.layout'
  .directive 'scrollNav', [
    '$location'
    '$rootScope'
    '$timeout'
    'authService'
    scrollNav
  ]
