extends Node

var industries : Dictionary = {}

var cities : Dictionary = {}

var areas : Dictionary = {}

func load_industries():

	var dir = DirAccess.open(
		"res://data/industry/industry_tres"
	)

	dir.list_dir_begin()

	while true:

		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):

			var industry =load("res://data/industry/industry_tres/"+ file)

			industries[industry.id] =industry
