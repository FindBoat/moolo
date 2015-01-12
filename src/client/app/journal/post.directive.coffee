post = (utils) ->
  restrict: 'A'
  scope:
    thePost: '='
  templateUrl: '/client/app/journal/post.jade'
  link: ($scope, $element, $attr) ->
    e = $element.find '.page-post'
    $scope.thePost.content = utils.nl2br $scope.thePost.content
    $scope.date = ''
    $scope.time = ''
    $scope.onMouseover = ->
      e.removeClass 'post-attr-hide'
      return
    $scope.onMouseleave = ->
      e.addClass 'post-attr-hide'
      return

    return

angular
  .module 'app.journal'
  .directive 'post', ['utils', post]

  
