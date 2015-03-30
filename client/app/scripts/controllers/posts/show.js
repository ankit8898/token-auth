'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

app.controller('PostsShowCtrl', function ($scope,Post,$stateParams,Comment) {

  $scope.commentForm = {post_id: $stateParams.id};

   Post.get($stateParams.id).then(function(post){
      $scope.post = post.data;
      $scope.comments    = $scope.post.comments;
      $scope.likes       = $scope.post.likes;
      $scope.likes_count = $scope.post.likes_count;
    });


  $scope.submit = function(){
    Comment.create($scope.commentForm).then(function(comment){
      $scope.comments.push(comment.data);
      $scope.message = "Thanks for comment!"
    })
    $scope.commentForm.comment = null;
   };
});
