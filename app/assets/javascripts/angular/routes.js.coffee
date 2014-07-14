# AngularRails.config ($stateProvider, $urlRouterProvider, $routeProvider) ->
AngularRails.config ($stateProvider, $urlRouterProvider) ->

	$urlRouterProvider.otherwise("/")

	$stateProvider

		.state('app',

			url: "/"

			templateUrl: "/assets/crew/index.html"

			controller: "CrewMembersController"

		)
		.state('app.crew',

			url: "crew/:id"

			templateUrl: "/assets/crew/show.html"

			controller: "CrewMemberController"

		)

	# $routeProvider

	#	.when "/",

	#		templateUrl: "/assets/crew/index.html"

	#		controller: "CrewMembersController"

	#	.when "/crew/:id",

	#		templateUrl: "/assets/crew/show.html"

	#		controller: "CrewMemberController"

	#	.otherwise redirectTo: "/"