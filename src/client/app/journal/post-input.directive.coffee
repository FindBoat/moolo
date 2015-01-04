postInput = (geoService) ->
  restrict: 'A'
  scope:
    newPost: '='
    defaultLocation: '@'
    postMethod: '&'
  templateUrl: '/client/app/journal/post-input.jade'
  link: ($scope, $element, $attr) ->
    textarea = $element.find 'textarea'
    attr = $element.find '.attr-text'

    $scope.charLeft = 200
    $scope.onFocus = ->
      attr.removeClass 'attr-hide'
      return
    $scope.onBlur = ->
      attr.addClass 'attr-hide'
      return
    $scope.onChange = ->
      $scope.charLeft = 200 - $scope.newPost.content.length
      return
    $scope.cancel = ->
      textarea.val ''
      return
    $scope.submitPost = ->
      if !$scope.newPost.content? or $scope.newPost.content is '' then return
      $scope.postMethod()
      textarea.val ''
      return
    $scope.newPost.location = $scope.defaultLocation

    geoService.getCityState().then (res) ->
      $scope.newPost.location = res.city + ', ' + res.state

    # Esc to blur and command+enter to post.
    textarea = $element.find 'textarea'
    textarea.bind 'keydown', (e) ->
      if e.keyCode is 13 and e.metaKey
        $scope.submitPost()
      else if e.keyCode is 27
        textarea.blur()

    return

angular
  .module 'app.journal'
  .directive 'postInput', ['geoService', postInput]

  
