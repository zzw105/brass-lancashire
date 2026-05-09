extends Resource
class_name AreaDefinition


## 唯一ID
@export var id: StringName

## 所属城市
@export var affiliated_city: CityData

## 可建造产业
@export var can_industry_list: Array[IndustryData]

# Runtime Cache
var affiliated_city_id : StringName

var can_industry_ids : Array[StringName]

func build_runtime_cache():

	if affiliated_city:
		affiliated_city_id =affiliated_city.id

	can_industry_ids.clear()

	for industry_def in can_industry_list:

		can_industry_ids.append(
			industry_def.id
		)
