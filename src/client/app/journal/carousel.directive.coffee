carousel = ($timeout) ->
  restrict: 'A'
  scope:
    mems: '='
  templateUrl: '/client/app/journal/carousel.jade'
  link: ($scope, $element, $attr) ->
    refreshPromise = null
    $scope.indexShow = -1
    $scope.refresh = ->
      $scope.indexShow = ($scope.indexShow + 1) %% $scope.mems.length
      if refreshPromise? then $timeout.cancel refreshPromise
      refreshPromise = $timeout $scope.refresh, 20000

    $timeout $scope.refresh, 200

    return

angular
  .module 'app.journal'
  .directive 'carousel', ['$timeout', carousel]
