journalController = (
  $anchorScroll,
  $route,
  logger,
  posts,
  postsResource,
  utils
) ->
  vm = this
  init = () ->
    vm.post = {}
    vm.posts = posts
    vm.page = 0
    vm.numPerPage = 7
    vm.defaultLocation =
      if posts[0]? then posts[0].location else 'san francisco, ca'
    vm.mems = getMems()

    vm.postMethod = postMethod
    vm.nextPage = ->
      vm.page++
      $anchorScroll()
    vm.prevPage = ->
      vm.page--
      $anchorScroll()


  postMethod = ->
    postsResource.save vm.post
    , (post) ->
      $route.reload()
    , (error) ->
      logger.warning 'Create post fail', error

  announce = [
      {
        createAt: moment()
        content: 'Moolo is a PRIVATE place for your daily thoughts. No comments, no likes, no formatting, we want you only focus on writing.'
        location: 'san francisco, ca'
      }
      {
        createAt: moment()
        content: 'No one reads what they wrote before, but Moolo reminds you with your previous thoughts smartly. Once you keep writing on Moolo for a week, we will show your previous thoughts here.'
        location: 'san francisco, ca'
      }
      {
        createAt: moment()
        content: 'We recommend a 200 characters limit for each post, but it\'s not restricted. A short post helps you focus on the most important idea and also it\'s easier to keep writing everyday.'
        location: 'san francisco, ca'
      }
      {
        createAt: moment()
        content: 'Please allow Moolo to track your location, which is automatically set to each post. So you will know when and where you wrote the post.'
        location: 'san francisco, ca'
      }
      {
        createAt: moment()
        content: 'We welcome your feedbacks and thoughts. Please email sgzhaohang@gmail.com.'
        location: 'san francisco, ca'
      }
  ]


  getMems = ->
    numMems = 5
    mems = []
    if vm.posts.length > 35
      mems.concat utils.sample(vm.posts, numMems)
    else if vm.posts.length > 7
      mems = mems.concat utils.sample(vm.posts, 2)

    for i in [0...numMems - mems.length]
      mems.push announce[i]

    return mems
      
  init()
  return


journalController.$inject = [
  '$anchorScroll'
  '$route'
  'logger'
  'posts'
  'postsResource'
  'utils'
]
angular
  .module 'app.journal'
  .controller 'journalController', journalController
