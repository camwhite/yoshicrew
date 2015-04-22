'use strict'

angular.module 'yoshiCrewApp'

.controller 'MainCtrl', ($scope, $timeout, $firebaseArray) ->
  ref = new Firebase 'https://yoshicrew.firebaseio.com/'
  tagSync = $firebaseArray ref.child 'tags'

  powerUp = new buzz.sound 'https://dl.dropbox.com/s/ygtgrmibg7la7lm/smb3_power-up.wav?dl=0',
    formats: ['wav'],
    preload: true

  $timeout ->
    powerUp.play()
  , 5000

  $scope.tags = tagSync
  $scope.tag = ''

  $scope.addTag = ->
    trimTag()

    $scope.tags.$add $scope.tag
    $scope.tag = ''

  trimTag = ->
    $scope.tags.$loaded().then (tags) ->
      tag = tags[0]
      console.log tag

      if $scope.tags.length > 200
        $scope.tags.$remove(tag).then (tags) ->
      else
        return
