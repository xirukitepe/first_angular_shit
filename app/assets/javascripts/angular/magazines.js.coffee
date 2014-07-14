AngularRails.factory "Magazine", ($resource) ->
	$resource("/magazines/:id", { id: "@id"}, {
		query: { method: "GET", isArray: false },
		update: {method: "PUT"},
		delete: {method: "DELETE"}
	})