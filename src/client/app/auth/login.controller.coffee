loginController = ($location, authService, logger) ->
  vm = this
  init = () ->
    vm.login = {}
    vm.formSubmitted = false
    vm.loginFail = false
    vm.submitLoginForm = submitLoginForm


  submitLoginForm = ->
    if not vm.form.$valid
      vm.formSubmitted = true
      return
    
    authService.login(vm.login).then(
      (res) ->
        $location.path '/journal'
    , (error) ->
        vm.loginFail = true
        logger.error 'Login error'
    )
    
  init()
  return


loginController.$inject = ['$location', 'authService', 'logger']
angular
  .module 'app.auth'
  .controller 'loginController', loginController
  
