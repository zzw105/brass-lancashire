extends Resource
class_name CityRuntimeState
## 城市运行时属性

## 城市运行时属性-产业城市资源id
var definition_id: StringName


## 城市运行时属性-init函数
func _init(id: StringName) -> void:
	definition_id = id


## 城市运行时属性-获取城市静态属性
func get_city_definition() -> CityDefinition:
	return DataManager.get_city(definition_id)
