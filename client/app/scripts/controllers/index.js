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
    console.log("Sucessful login")
    $state.go('products');
  });


  $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(resp) {
          console.log(resp);
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };
//   $auth.submitLogin($scope.loginForm, {
//   config: 'default'
// });


  $rootScope.$on('auth:login-error', function(ev, reason) {
    $scope.errors = reason.errors[0];
  });

});
