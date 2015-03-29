'use strict';

/**
 * @ngdoc overview
 * @name monApp
 * @description
 * # monApp
 *
 * Main module of the application.
 */
var app = angular.module('monApp', ['ui.router','ng-token-auth']);

app.config(function($stateProvider, $urlRouterProvider,$authProvider) {

  $authProvider.configure({
      apiUrl:                  'http://localhost:3000',
    });

  $urlRouterProvider.otherwise("/login");
  $stateProvider
    .state('login', {
      url: '/login',
      templateUrl: 'views/sessions/new.html',
      controller: 'IndexCtrl'
    })
    .state('products', {
      url: '/products',
      templateUrl: 'views/products/index.html',
      resolve: {
          auth: function($auth) {
            return $auth.validateUser();
          }
        },
      controller: 'ProductsCtrl'
    })
});
