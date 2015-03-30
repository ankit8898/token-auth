'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the monApp
 */
 app.controller('IndexCtrl', function ($scope,$auth,$rootScope,$state) {


  $scope.student   = false;
  $scope.professor = false;

  $scope.toggleForm = function(type){
    if (type === 'student') {
      $scope.student   = true;
      $scope.professor = false;
    }else{
      $scope.student   = false;
      $scope.professor = true;
    }
  }

  $rootScope.$on('auth:login-success', function(ev, user) {
    console.log("Successful login!")
    if (user.configName == 'default') {
      console.log("Routing to Student access..")
      $state.go('products');
    } else if (user.configName == 'prof'){
      console.log("Routing to Professor access..")
      $state.go('courses');
    }
  });

  $rootScope.$on('auth:login-error', function(ev, reason) {
    $scope.errors = reason.errors[0];
  });

});
