extends Resource
class_name IndustryRuntimeState
## 产业运行时属性

## 产业运行时属性-产业静态资源id
var definition_id: StringName


## 产业运行时属性-init函数
func _init(id: StringName) -> void:
	definition_id = id


## 产业运行时属性-获取产业静态属性
func get_industry_definition() -> IndustryDefinition:
	return DataManager.get_industry(definition_id)
