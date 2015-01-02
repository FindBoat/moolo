journalController = ($route, logger, posts, postsResource) ->
  vm = this
  init = () ->
    vm.post = {}
    vm.posts = posts
    vm.submitPostForm = submitPostForm

    vm.mems = [
      {
        createAt: 'APRIL 2, 2011'
        content: 'baljdlvajdlkfjalkdjflkadjflkasjdflasdjflasdjfdfadfasdfadfadfasdfasdfdfdf dafasdf asdfadf adfadfa sdafasdffasd sadf adsf adf'
        location: 'san francisco, ca'
      }
      {
        createAt: 'March 22, 2010'
        content: 'My name is Michiel de Graaf I design interfaces, craft websites and write cascading style sheets & hypertext markup. Previously lead designer Previously lead designer Previously lead designer Previously'
        location: 'san francisco, ca'        
      }
      {
        createAt: 'June 2, 2001'
        content: 'Ok Idlakfjalksdjflkasjdflkajsdfddn ddi'
        location: 'palo alto, ca'
      }
    ]

    vm.ps = [1, 2, 3, 4, 5, 6, 7]

  submitPostForm = ->
    postsResource.save vm.post
    , (post) ->
      $route.reload()
    , (error) ->
      logger.warning 'Create post fail', error

  init()
  return


journalController.$inject = ['$route', 'logger', 'posts', 'postsResource']
angular
  .module 'app.posts'
  .controller 'journalController', journalController
