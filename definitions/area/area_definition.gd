extends Resource
class_name AreaDefinition
## 区域静态属性

## 区域静态属性-唯一ID
@export var id: StringName

## 区域静态属性-可建造产业-开发用数据
@export var can_industry_list: Array[IndustryDefinition] = []

## 区域静态属性-可建造产业Ids
var can_industry_list_ids: Array[StringName] = []

## 区域静态属性-所属城市Id
var city_id: StringName = ""
