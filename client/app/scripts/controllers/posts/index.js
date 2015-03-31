'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

 app.controller('PostsIndexCtrl', function ($scope,Post,$state) {


  $scope.showPostForm = false;
  $scope.postForm = {};

  Post.all().then(function(posts){
    $scope.posts = posts.data;
  });

  $scope.readMore = function(id){
    console.log(id)
    $state.go('post',{'id': id})
  };

  $scope.submit = function(){
    console.log($scope.postForm);
    Post.create($scope.postForm).then(function(post){
      $scope.posts.push(post.data);
      $scope.successMessage = 'Post successfully created!'
      $scope.postForm = {};
    })
  }

  $scope.newPost = function(){
    $scope.showPostForm = true;
  };
});
