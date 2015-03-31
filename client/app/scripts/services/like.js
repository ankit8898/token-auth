'use strict';

/**
 * @ngdoc service
 * @name monApp.Product
 * @description
 * # Product
 * Service in the monApp.
 */
app.service('Like', function Like($http,$auth) {
    // AngularJS will instantiate a singleton by calling "new" on this function

   this.create = function(id,type){
      return $http.post($auth.apiUrl() + '/likes', {like: {likeable_id: id, likeable_type: type}});
    }

  });
