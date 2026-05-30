extends Resource
class_name MarketDefinition
## 市场数据类


## 市场数据类-唯一ID
@export var id: StringName

## 市场数据类-所属城市
var city_id: StringName = ""

## 市场数据类-显示名称
@export var display_name: String = ""

## 市场数据类-啤酒奖励
@export var beer_reward: Dictionary = {}

## 市场数据类-贸易板块开启人数需要大于多少
@export var trade_sector_player_limit: int = 0