# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = angular.module("myApp", [])

App.controller("TimetableCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.weeks = []
  $scope.class = "btn btn-success"
  $scope.lunchCount = 0

  $scope.init = ->
    for i in [1..13]
      $scope.weeks.push([1..5].map -> 0)

  $scope.increment = (week, day) ->
    if $scope.weeks[week][day] is 0
      $scope.weeks[week][day] = 1
      $scope.lunchCount++
    else
      $scope.weeks[week][day] = 0
      $scope.lunchCount--

  $scope.getClass = (day) ->
    if day is 0 then "btn-success" else "btn-danger"

  $scope.submitCount = ->
    jsonObj = {"data": $scope.weeks}
    $http.post("/api/lunches/submit.json", jsonObj)
      .success (data) ->
        console.log data
      .error (data) ->
        console.log data

  $scope.init()
])
