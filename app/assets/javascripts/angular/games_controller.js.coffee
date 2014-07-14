AngularRails.controller "GamesController", ($http, $scope) ->

	$scope.init = () ->
		$scope.currentPage = 1
		$scope.getGames()

	$scope.getGames = () ->

		#$http({ method: "GET", url: "/games" })

		#	.success (response) ->

		#		$scope.games = response.games

		http = 
			method: "GET",
			url: "/games",
			params:
				page: $scope.currentPage

		$http(http)
			.success (response) ->
				$scope.games = response.games
				$scope.paging = response.meta
				# $scope.initPaging(response.meta)

	# $scope.createPages = () ->
	#	$scope.pages = [1..$scope.paging.number_of_pages]



	# $scope.setPage = (newPage) ->
	#	newPage = 1 if newPage < 1

	#	$scope.currentPage = newPage
	#	$scope.getGames()