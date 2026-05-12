extends Resource
## 道路数据类

class_name LinkDefinition

## 道路数据类-唯一ID
@export var id: StringName

## 道路数据类-显示名称
@export var display_name: String = ""

## 道路数据类-水路
@export var is_water: bool = false

## 道路数据类-铁路
@export var is_rail: bool = false

## 道路数据类-链接城市信息
# @export var linked_city_info: CityDefinition = null

## 道路数据类-链接城市Ids
var linked_city_ids: Array[StringName] = []
# 