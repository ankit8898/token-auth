'use strict';

/**
 * @ngdoc function
 * @name monApp.controller:CoursesCtrl
 * @description
 * # CoursesCtrl
 * Controller of the monApp
 */
app.controller('CoursesCtrl', function ($scope,Course) {
    Course.all().then(function(courses){
      $scope.courses = courses;
    });

  });
