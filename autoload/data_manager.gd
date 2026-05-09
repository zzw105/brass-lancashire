extends Node

var industries : Dictionary = {}

var cities : Dictionary = {}

var areas : Dictionary = {}

func load_definitions():
	load_industries()
	load_areas()
	
func get_area(
	id : StringName
) -> AreaDefinition:

	if !areas.has(id):

		push_error(
			"Area not found: %s" % id
		)

		return null

	return areas[id]
	
func load_areas():

	var dir = DirAccess.open(
		"res://definitions/area/area_tres/"
	)

	dir.list_dir_begin()

	while true:

		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):

			var area =load("res://definitions/area/area_tres/"+ file) as AreaDefinition
			area.build_runtime_cache()
			print("11",area)
			areas[area.id] =area


func load_industries():

	var dir = DirAccess.open(
		"res://definitions/industry/industry_tres"
	)

	dir.list_dir_begin()

	while true:

		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):

			var industry =load("res://definitions/industry/industry_tres/"+ file)

			industries[industry.id] =industry
