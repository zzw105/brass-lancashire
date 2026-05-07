class_name SlotState
extends Resource


## 所属城市
@export var affiliated_city: CityData
## 可建造类型
@export var allowed_building_types: Array[GlobalEnum.BuildingNameEnum] 
@export var is_occupied: bool = false
@export var owner_id: int = -1
