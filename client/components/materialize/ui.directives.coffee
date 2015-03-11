'use strict'
angular.module "materialUI", 
[
  "materialUI.select"
]

angular.module "materialUI.select", []
.directive "MaterialSelect", ($compile, $timeout) ->
  restrict: 'AC'
  link: (scope, element, attrs) ->
    if element.is('select')
      $compile(element.contents())(scope)
      $timeout(()->
        element.material_select();
      )