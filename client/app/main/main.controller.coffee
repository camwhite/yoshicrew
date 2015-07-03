'use strict'

angular.module 'yoshiCrewApp'

.controller 'MainCtrl', ($scope, $timeout, $firebaseArray) ->
  ref = new Firebase 'https://yoshicrew.firebaseio.com/'
  tagSync = $firebaseArray ref.child 'tags'

  $scope.tags = tagSync
  $scope.tag = ''

  $scope.tags.$loaded().then (tags) ->
    if $scope.tags.length > 100
      for tag in [0...50]
        $scope.tags.$remove tag


  powerUp = new buzz.sound 'https://dl.dropbox.com/s/ygtgrmibg7la7lm/smb3_power-up.wav?dl=0',
    formats: ['wav'],
    preload: true

  $scope.powerUp =  ->
    powerUp.play()

  $scope.addTag = ->
      $scope.tags.$add $scope.tag
      $scope.tag = ''

  $scope.yoshiYT = 'https://www.youtube.com/watch?v=WhMTqBs6EJM&list=PLsMql-lQ6Qxcllzn9-9ox8dOq82j8pD24'

