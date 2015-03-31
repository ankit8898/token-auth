'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

app.controller('PostsShowCtrl', function ($scope,Post,$stateParams,Comment,Like) {

  $scope.commentForm = {post_id: $stateParams.id};

   Post.get($stateParams.id).then(function(post){
      $scope.post = post.data;
      $scope.comments       = $scope.post.comments;
      $scope.comments_count = $scope.post.comments_count;
      $scope.likes          = $scope.post.likes;
      $scope.likes_count    = $scope.post.likes_count;
    });

   $scope.like = function(id,type){
    Like.create(id,type).then(function(res){
      $scope.message = "Liked " + res.data.likeable_type + "!"
    });
   };

  $scope.submit = function(){
    Comment.create($scope.commentForm).then(function(comment){
      $scope.comments.push(comment.data);
      $scope.post.comments_count += 1
      $scope.message = "Thanks for comment!"
    })
    $scope.commentForm.comment = null;
   };
});
