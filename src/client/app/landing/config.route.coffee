appRun = (routehelper) ->
  routehelper.configureRoutes [
    {
      url: '/'
      config:
        templateUrl: '/client/app/landing/landing.jade'
        controllerAs: 'vm'
        title: 'Landing'
        logoutRequired: true
    }
  ]

appRun.$inject = ['routehelper']

angular
  .module 'app.landing'
  .run appRun


