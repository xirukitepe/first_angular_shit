# AngularRails.controller "CrewMemberController" , ($scope, Crew, $routeParams) ->

#	$scope.crew = Crew.find($routeParams.id)

AngularRails.controller "CrewMemberController" , ($scope, Crew, $stateParams) ->

	$scope.crew = Crew.find($stateParams.id)