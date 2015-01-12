appRun = (routehelper) ->
  routehelper.configureRoutes [
    {
      url: '/signup'
      config:
        templateUrl: '/client/app/auth/signup.jade'
        controller: 'signupController'
        controllerAs: 'vm'
        title: 'Signup'
        logoutRequired: true
    }
    {
      url: '/login'
      config:
        templateUrl: '/client/app/auth/login.jade'
        controller: 'loginController'
        controllerAs: 'vm'
        title: 'Login'
        logoutRequired: true
    }
  ]

appRun.$inject = ['routehelper']

angular
  .module 'app.auth'
  .run appRun


