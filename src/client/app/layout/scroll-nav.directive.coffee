scrollNav = ($timeout) ->
  restrict: 'A'
  templateUrl: '/client/app/layout/nav.jade'
  link: ($scope, $element, $attr) ->
    nav = $element.find 'nav'
    brand = $element.find '.navbar-brand'

    $scope.onMouseover = ->
      nav.removeClass 'nav-hide'
      return

    $scope.onMouseleave = ->
      nav.addClass 'nav-hide'
      return

    removeShake = ->
      brand.removeClass 'shake'
      return
    $timeout removeShake, 600 


angular
  .module 'app.layout'
  .directive 'scrollNav', ['$timeout', scrollNav]
