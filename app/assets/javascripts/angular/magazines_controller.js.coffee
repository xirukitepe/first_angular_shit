AngularRails.controller "MagazinesController", ($scope, Magazine) ->
	$scope.getBooks = () ->

		# $scope.books = Magazine.query()
		

		Magazine.query (response) ->
			$scope.books = response.magazines

		# Magazine.query().$promise.then (magazines) ->
		#	$scope.books = magazines

	$scope.delete = (book) ->
		Magazine.delete(book)

		$scope.getBooks()


	$scope.save = () ->
		if $scope.book.id?

			Magazine.update($scope.book)

		else
			Magazine.save($scope.book)

		$scope.book = {}

		$scope.getBooks()

	$scope.edit = (book) ->

		$scope.book = Magazine.get({ id: book.id })

	