appRun = (routehelper) ->
  routehelper.configureRoutes [
    {
      url: '/journal'
      config:
        templateUrl: '/client/app/journal/journal.jade'
        controller: 'journalController'
        controllerAs: 'vm'
        title: 'Journal'
        loginRequired: true
        resolve:
          posts: ['postsResource', (posts) ->
            posts.query().$promise
          ]
    }
  ]

appRun.$inject = ['routehelper']

angular
  .module 'app.journal'
  .run appRun
