// Generated by CoffeeScript 1.7.1
(function() {
  angular.module('ui.instagram', []).service('Instagram', function($http) {
    return {
      get: function(id, clientId, cb) {
        var URL;
        URL = "https://api.instagram.com/v1/users/" + id + "/media/recent/?client_id=" + clientId + "&callback=JSON_CALLBACK";
        return $http.jsonp(URL).success(function(resolution) {
          return cb(resolution.data);
        });
      }
    };
  }).directive('uiInstagram', function() {
    return {
      restrict: 'EA',
      controller: function($scope, $attrs, Instagram) {
        $scope.grams = [];
        return Instagram.get($attrs.userId, $attrs.clientId, function(grams) {
          return $scope.grams = grams;
        });
      }
    };
  });

}).call(this);