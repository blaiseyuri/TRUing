'use strict'
angular.module 'truingApp'
.controller 'UserCtrl', (User, $http, Auth, $scope, $document) ->

  $http.get '/api/users'
  .success (users) ->
    $scope.users = users

  $scope.edit_mode = false
  $scope.save = (user) ->
    User.save(user)


  $scope.delete = (user) ->
    User.remove id: user._id
    _.remove $scope.users, user

  

