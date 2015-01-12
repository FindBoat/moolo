ErrorInterceptor = ($location, $q, $window, logger) ->
  responseError: (rejection) ->
    logger.warning "error with status #{rejection.status} " +
        "and message: #{rejection.data}"

    if rejection.status is 401
      # CLear local storage.
      $window.localStorage.removeItem 'token'
      $window.localStorage.removeItem 'user'
      
      $location.path '/'
      return

    $q.reject rejection

ErrorInterceptor.$inject = ['$location', '$q', '$window', 'logger']

angular
  .module 'app.core'
  .factory 'ErrorInterceptor', ErrorInterceptor

