'use strict';

/**
 * @ngdoc overview
 * @name monApp
 * @description
 * # monApp
 *
 * Main module of the application.
 */
var app = angular.module('monApp', ['ng-token-auth','ui.router']);

// app.config(function($authProvider) {
// });

app.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/sign_in");
  //
  // Now set up the states
  $stateProvider
    .state('sign_in', {
      url: "/sign_in",
      templateUrl: "views/sessions/new.html",
      constroller: "UserSessionsCtrl"
    })
    // .state('home', {
    //   url: "/",
    //   templateUrl: "views/home.html",
    //   controller: "MainCtrl"
    // })
    .state('products', {
      url: "/products",
      templateUrl: "views/products/index.html",
      controller: "ProductsCtrl",
      resolve: {
          auth: function($auth) {
            return $auth.validateUser();
          }
        }
    })
});
