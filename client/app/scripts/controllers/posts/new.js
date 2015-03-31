'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:PostsCtrl
 * @description
 * # PostsCtrl
 * Controller of the monApp
 */

app.controller('PostsNewCtrl', function ($scope,Post,$stateParams) {

  $scope.postForm = {};

  $scope.submit = function(){
    Post.create($scope.postForm).then(function(post){
      $state.go('post',{id: post.data.id});
    })

   };
});
