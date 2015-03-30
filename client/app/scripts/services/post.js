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
  });
