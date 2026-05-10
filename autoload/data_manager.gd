extends Node
## 静态游戏数据

## 静态游戏数据-城市
var cities: Dictionary = {}
## 静态游戏数据-区域
var areas: Dictionary[StringName,AreaDefinition] = {}
## 静态游戏数据-产业
var industries: Dictionary = {}


## 加载静态数据
func load_definitions():
	load_industries()
	load_areas()


## 获取区域静态数据
func get_area(id: StringName) -> AreaDefinition:
	if !areas.has(id):
		push_error("Area not found: %s" % id)
		return null
	return areas[id]


## 加载
func load_areas():
	var dir = DirAccess.open("res://definitions/area/area_tres/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var area = load("res://definitions/area/area_tres/" + file) as AreaDefinition
			area.build_runtime_cache()
			areas[area.id] = area


func load_industries():
	var dir = DirAccess.open("res://definitions/industry/industry_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var industry = load("res://definitions/industry/industry_tres/" + file)

			industries[industry.id] = industry
