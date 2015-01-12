landingHeader = ($timeout) ->
  restrict: 'A'
  templateUrl: '/client/app/landing/landing-header.jade'
  link: ($scope, $element, $attr) ->
    logo = $element.find '.logo'
    desc = $element.find 'h3'

    removeShake = ->
      logo.removeClass 'shake'
      return
    $timeout removeShake, 600

    showDesc = ->
      desc.addClass 'appear'
      return
    $timeout showDesc, 500


angular
  .module 'app.landing'
  .directive 'landingHeader', ['$timeout', landingHeader]
