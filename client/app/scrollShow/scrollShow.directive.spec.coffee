'use strict'

describe 'Directive: scrollShow', ->

  # load the directive's module
  beforeEach module 'yoshiCrewApp'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<scroll-show></scroll-show>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the scrollShow directive'
