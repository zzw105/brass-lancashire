extends Node
## 静态游戏数据

## 静态游戏数据-城市
var cities: Dictionary[StringName, CityDefinition] = {}
## 静态游戏数据-区域
var areas: Dictionary[StringName, AreaDefinition] = {}
## 静态游戏数据-产业
var industries: Dictionary[StringName, IndustryDefinition] = {}


## 静态游戏数据-加载全部静态数据
func load_definitions():
	load_industries()
	load_areas()
	load_cities()


## 静态游戏数据-获取城市静态数据
func get_city(id: StringName) -> CityDefinition:
	if !cities.has(id):
		push_error("cities not found: %s" % id)
		return null
	return cities[id]


## 静态游戏数据-获取区域静态数据
func get_area(id: StringName) -> AreaDefinition:
	if !areas.has(id):
		push_error("Area not found: %s" % id)
		return null
	return areas[id]

## 静态游戏数据-获取产业静态数据
func get_industry(id: StringName) -> IndustryDefinition:
	if !industries.has(id):
		push_error("industries not found: %s" % id)
		return null
	return industries[id]


## 静态游戏数据-加载区域静态数据
func load_areas():
	var dir = DirAccess.open("res://definitions/area/area_tres/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var area: AreaDefinition = load("res://definitions/area/area_tres/" + file)
			areas[area.id] = area


## 静态游戏数据-加载产业静态数据
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

## 静态游戏数据-加载城市静态数据
func load_cities():
	var dir = DirAccess.open("res://definitions/city/city_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var city = load("res://definitions/city/city_tres/" + file)

			cities[city.id] = city