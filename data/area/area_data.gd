extends Resource
class_name Area_Data


## 唯一ID
@export var id: StringName

## 所属城市
@export var affiliated_city: CityData

## 可建造产业
@export var can_industry_list: Array[IndustryData]
