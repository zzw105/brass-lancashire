extends Resource
class_name TradeCardDefinition
## 贸易板块卡牌


## 贸易板块卡牌-唯一ID
@export var id: StringName

## 贸易板块卡牌-产业信息-编辑器开发用数据
@export var industry_info: Array[IndustryDefinition] = []
## 贸易板块卡牌-产业信息Ids
var industry_ids: Array[StringName] = []

## 贸易板块卡牌-使用人数需要大于多少
@export var trade_player_limit: int = 0
