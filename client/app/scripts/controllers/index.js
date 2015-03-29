'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the monApp
 */
app.controller('IndexCtrl', function ($scope,$auth,$rootScope,$state) {

    $rootScope.$on('auth:login-success', function(ev, user) {
      $rootScope.currentUser = user;
      console.log(user.email);
    console.log("welcome " + user.email);
    $state.go('products');
});


  $rootScope.$on('auth:login-error', function(ev, reason) {
    console.log('auth failed because', reason.errors[0]);
    $scope.errors = reason.errors[0];
});

  });
