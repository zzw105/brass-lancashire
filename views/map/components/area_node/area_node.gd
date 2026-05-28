extends Node2D
class_name AreaNode

## 区域属性
@export var area_data: AreaDefinition


func _ready():
	print(area_data)
	EventBus.global_event_changed.connect(_on_global_event_changed)
	pass

func _on_global_event_changed(event: EventBus.GlobalEvent):
	if event == EventBus.GlobalEvent.LOAD_DEFINITIONS_COMPLETE and area_data and area_data.get("can_industry_list_ids"):
			for i in range(area_data.can_industry_list_ids.size()):
				var industry_id = area_data.can_industry_list_ids[i]
				var label = Label.new()
				label.position = Vector2(0, i * 13)
				label.modulate = Color(1, 1, 1, 0.7)
				label.add_theme_font_size_override("font_size", 10)
				label.text = DataManager.get_industry(industry_id).display_name
				add_child(label)
	pass

func _on_mouse_entered():
	print("进入：", name)
	# print(area_data)
	# if area_data.get("can_industry_list"):
	# 	print(area_data.can_industry_list)
	# if area_data.get("can_industry_list_ids"):
	# 	print(area_data.can_industry_list_ids)
	# CursorManager.enter_interactive()
	# 在这里继续控制高光等其他交互


func _on_mouse_exited():
	print("离开：", name)
	CursorManager.exit_interactive()
	# 在这里控制高光消失等
