signupController = ($location, authService, logger) ->
  vm = this
  init = () ->
    vm.signup = {}
    vm.formSubmitted = false
    vm.signupFail = false
    vm.signupError = null
    vm.submitSignupForm = submitSignupForm


  submitSignupForm = ->
    if not vm.form.$valid
      vm.formSubmitted = true
      return

    authService.signup(vm.signup).then(
      (res) ->
        $location.path '/journal'
      , (error) ->
        vm.signupFail = true
        vm.signupError = error.data
    )
    
  init()
  return


signupController.$inject = ['$location', 'authService', 'logger']

angular
  .module 'app.auth'
  .controller 'signupController', signupController
  
