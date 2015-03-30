'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the monApp
 */
app.controller('ProductsCtrl', function ($scope,$auth,$rootScope,Product) {

    Product.all().then(function(products){
      $scope.products = products;
    });

    var checkAccess = function(){
      console.log($auth);
    }

    checkAccess();
  });
