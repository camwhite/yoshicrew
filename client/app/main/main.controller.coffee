'use strict'

angular.module 'yoshiCrewApp'

.controller 'MainCtrl', ($scope, $timeout) ->
  powerUp = new buzz.sound 'https://dl.dropbox.com/s/ygtgrmibg7la7lm/smb3_power-up.wav?dl=0',
    formats: ['wav'],
    preload: true

  $timeout ->
    powerUp.play()
  , 5000

  $scope.login = ->
    SC.connect ->
  		SC.get '/me',  (me) ->
        $scope.me = me

        console.log $scope.me

