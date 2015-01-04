slice = ->
  (arr, start, end) ->
    (arr or []).slice start, end

angular
  .module 'app.core'
  .filter 'slice', [slice]
