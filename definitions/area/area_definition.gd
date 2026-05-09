extends Resource
class_name AreaDefinition


## 唯一ID
@export var id: StringName

## 可建造产业
@export var can_industry_list: Array[IndustryDefinitions]=[]

# Runtime Cache

## 可建造产业id
var can_industry_ids : Array[StringName]

func build_runtime_cache():

	can_industry_ids.clear()

	for industry_def in can_industry_list:

		can_industry_ids.append(
			industry_def.id
		)
