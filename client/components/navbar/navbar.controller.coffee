'use strict'

angular.module 'truingApp'
.controller 'NavbarCtrl', ($scope, $location, Auth, $document, $state) ->
  $scope.menu = [
    {title: 'Home', link: '/'}
    {title: 'Blog', link: '/blog'}
  ]

  $scope.inAdmin =  if $state.current.name == "admin" then true else false
  $scope.isCollapsed = true
  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.isAdmin = Auth.isAdmin
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.logout = ->
    Auth.logout()
    $location.path '/login'

  $scope.isActive = (route) ->
    route is $location.path()

  $document.ready(()->
    $(".button-collapse").sideNav()
  )