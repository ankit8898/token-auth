'use strict';

/**
 * @ngdoc service
 * @name monApp.Product
 * @description
 * # Product
 * Service in the monApp.
 */
app.service('Comment', function Comment($http,$auth) {
    // AngularJS will instantiate a singleton by calling "new" on this function

   this.create = function(params){
      return $http.post($auth.apiUrl() + '/comments', {comment: {body: params.comment, post_id: params.post_id}});
    }

  });
