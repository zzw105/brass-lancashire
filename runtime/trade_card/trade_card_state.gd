extends Resource
class_name TradeCardState
## 贸易板块运行时状态


## 贸易板块运行时状态-分配的板块卡牌ID
var definition_id: StringName

## 贸易板块运行时状态-是否拥有啤酒
var has_beer: bool = true


## 贸易板块运行时状态-init函数
func _init(p_definition_id: StringName) -> void:
	definition_id = p_definition_id


## 贸易板块运行时状态-获取板块卡牌静态属性
func get_definition() -> TradeCardDefinition:
	return DataManager.get_trade_card(definition_id)
