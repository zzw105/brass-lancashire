extends Resource
class_name CityDefinition

## 唯一ID
@export var id: StringName

## 显示名称
@export var display_name: String=""

## 拥有的区域
@export var owned_area: Array[AreaDefinition]=[]
