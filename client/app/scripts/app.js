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

$authProvider.configure([
  {
    default: {
      /**
      This API url is the heroku end point,
      this should be bundled during grunt build.
      Uncomment it to do a fresh build manually.
      **/
      apiUrl:  'http://localhost:3000',
      //apiUrl:  'https://univ-mon.herokuapp.com',
      proxyIf: function() { window.isOldIE() }
    }
  }, {
    prof: {
      /**
      This API url is the heroku end point,
      this should be bundled during grunt build.
      Uncomment it to do a fresh build manually.
      **/
      //apiUrl:  'https://univ-mon.herokuapp.com',
      apiUrl:  'http://localhost:3000',
      proxyIf:               function() { window.isOldIE() },
      signOutUrl:            '/prof_auth/sign_out',
      emailSignInPath:       '/prof_auth/sign_in',
      emailRegistrationPath: '/prof_auth',
      accountUpdatePath:     '/prof_auth',
      accountDeletePath:     '/prof_auth',
      passwordResetPath:     '/prof_auth/password',
      passwordUpdatePath:    '/prof_auth/password',
      tokenValidationPath:   '/prof_auth/validate_token'
    }
  }
]);

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
          auth: function($auth,$state) {
            return $auth.validateUser().then(function(resp) {
              if(resp.configName  == 'default'){
                $state.go('not_authorized');
              }
            })
            .catch(function(){
              $state.go('login');
            });
          }
        },
      controller: 'ProductsCtrl'
    })
    .state('courses', {
      url: '/courses',
      templateUrl: 'views/courses/index.html',
      resolve: {
          auth: function($auth,$state) {
            return $auth.validateUser().then(function(resp) {
              if(resp.configName  == 'default'){
                $state.go('not_authorized');
              }
            })
            .catch(function(){
              $state.go('login');
            });
          }
        },
      controller: 'CoursesCtrl'
    })
     .state('posts', {
      url: '/posts',
      templateUrl: 'views/posts/index.html',
      resolve: {
          auth: function($auth,$state) {
            return $auth.validateUser().then(function(resp) {
              if(resp.configName  == 'prof'){
                $state.go('not_authorized');
              }
            })
            .catch(function(){
              $state.go('login');
            });
          }
        },
      controller: 'PostsIndexCtrl'
    })
     .state('post', {
      url: '/posts/:id',
      templateUrl: 'views/posts/show.html',
      resolve: {
          auth: function($auth,$state) {
            return $auth.validateUser().then(function(resp) {
              if(resp.configName  == 'prof'){
                $state.go('not_authorized');
              }
            })
            .catch(function(){
              $state.go('login');
            });
          }
        },
      controller: 'PostsShowCtrl'
    })
    .state('not_authorized', {
      url: '/not_authorized',
      templateUrl: 'views/not_authorized.html'
    })
});
