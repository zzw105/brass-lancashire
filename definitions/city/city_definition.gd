extends Resource
class_name CityDefinition
## 城市数据类

## 城市数据类-唯一ID
@export var id: StringName

## 城市数据类-显示名称
@export var display_name: String = ""

## 城市数据类-市场信息
@export var market_info: MarketDefinition = null

## 城市数据类-拥有的区域
@export var owned_area: Array[AreaDefinition] = []

## 城市数据类-拥有的道路
@export var owned_link: Array[LinkDefinition] = []
