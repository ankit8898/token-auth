'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the monApp
 */
angular.module('monApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
