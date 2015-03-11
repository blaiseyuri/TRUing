'use strict'

angular.module 'truingApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin',
    url: '/admin'
    templateUrl: 'app/admin/admin.html'
    controller: 'AdminCtrl'
  .state 'admin.users',
    url: '/users'
    views:
      'row1Column1':
        templateUrl: 'app/admin/users/users.html'
        controller: 'UserCtrl'
