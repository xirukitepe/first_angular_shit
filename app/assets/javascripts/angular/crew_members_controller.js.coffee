AngularRails.controller "CrewMembersController" , ($scope, Crew) ->
	$scope.crew = Crew.all()
	console.log()