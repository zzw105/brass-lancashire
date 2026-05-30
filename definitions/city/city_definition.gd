extends Resource
class_name CityDefinition
## 城市数据类

## 城市数据类-唯一ID
@export var id: StringName

## 城市数据类-显示名称
@export var display_name: String = ""

## 城市数据类-市场信息-编辑器开发用数据
@export var market_info: MarketDefinition = null
## 城市数据类-市场信息Id
var market_info_id: StringName = ""

## 城市数据类-拥有的区域-编辑器开发用数据
@export var owned_area: Array[AreaDefinition] = []
## 城市数据类-拥有的区域Ids
var owned_area_ids: Array[StringName] = []

## 城市数据类-拥有的道路-编辑器开发用数据
@export var owned_link: Array[LinkDefinition] = []
## 城市数据类-拥有的道路Ids
var owned_link_ids: Array[StringName] = []
