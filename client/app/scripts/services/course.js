'use strict';

/**
 * @ngdoc service
 * @name monApp.Product
 * @description
 * # Product
 * Service in the monApp.
 */
app.service('Course', function Course($http,$auth) {
    // AngularJS will instantiate a singleton by calling "new" on this function

    this.all = function(){
      return $http.get($auth.apiUrl() + '/courses')
    }
  });
