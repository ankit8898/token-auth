'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

app.controller('PostsIndexCtrl', function ($scope,Post,$state) {

   Post.all().then(function(posts){
    console.log(posts);
      $scope.posts = posts;
    });

   $scope.readMore = function(id){
    $state.go('post',{'id': id})
   };
  });
