scrollNav = ->
  restrict: 'A'
  templateUrl: '/client/app/layout/nav.jade'
  link: ($scope, $element, $attr) ->
    nav = $element.find 'nav'

    $scope.onMouseover = ->
      nav.removeClass 'nav-hide'
      return

    $scope.onMouseleave = ->
      nav.addClass 'nav-hide'
      return

angular
  .module 'app.layout'
  .directive 'scrollNav', [scrollNav]
