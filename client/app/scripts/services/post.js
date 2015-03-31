'use strict';

/**
 * @ngdoc service
 * @name monApp.post
 * @description
 * # post
 * Service in the monApp.
 */
app.service('Post', function Post($http,$auth) {
    // AngularJS will instantiate a singleton by calling "new" on this function

    this.all = function(){
      return $http.get($auth.apiUrl() + '/posts')
    }

    this.get = function(id){
      return $http.get($auth.apiUrl() + '/posts/' + id)
    }

    this.create = function(p){
      return $http.post($auth.apiUrl() + '/posts', {post: {body: p.body, title: p.title}});
    }

  });
