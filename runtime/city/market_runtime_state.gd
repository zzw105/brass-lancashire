extends Resource
class_name MarketRuntimeState
## 市场运行时属性


## 市场运行时属性-市场静态资源id
var definition_id: StringName

## 市场运行时属性-贸易板块
var trade_sector: String = ""


## 市场运行时属性-init函数
func _init(id: StringName) -> void:
	definition_id = id


## 城市运行时属性-获取城市静态属性
func get_market_definition() -> MarketDefinition:
	return DataManager.get_market(definition_id)
