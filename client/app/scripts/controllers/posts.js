'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

app.controller('PostsCtrl', function ($scope,Post) {

   Post.all().then(function(posts){
    console.log(posts);
      $scope.posts = posts;
    });
  });
