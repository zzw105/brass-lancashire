extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 获取属于 "cities" 组的所有节点（返回数组）
	var all_cities = get_tree().get_nodes_in_group("123")
	print(all_cities)
# 对每个城市做事
	for city in all_cities:
		print(city)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
