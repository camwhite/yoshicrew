'use strict'

angular.module 'yoshiCrewApp'
.directive 'scrollShow', ($window) ->
  restrict: 'AE'
  scope: {}
  link: (scope, element, attrs) ->
    w = angular.element $window

    w.scroll ->
      if w.scrollTop() > w.height()
        element.addClass 'active'
      else
        element.removeClass 'active'
