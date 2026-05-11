extends Resource
class_name AreaRuntimeState
## 区域运行时属性

## 区域运行时属性-区域静态资源id
var definition_id: StringName

## 区域运行时属性-可建造产业id
var can_industry_ids: Array[StringName]

## 区域运行时属性-所属城市id
var city_id: StringName


## 区域运行时属性-init函数
func _init(id: StringName, _can_industry_ids: Array[StringName]) -> void:
	definition_id = id
	can_industry_ids = _can_industry_ids


## 区域运行时属性-获取区域静态属性
func get_area_definition() -> AreaDefinition:
	return DataManager.get_area(definition_id)
