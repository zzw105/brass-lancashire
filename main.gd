extends Node


func _ready():
	print("=== 游戏启动 ===")

	print("=== 开始加载静态数据 ===")
	DataManager.load_definitions()
	print("=== 完成加载静态数据 ===")

	print("=== 开始加载游戏数据 ===")
	GameState.setup()
	print("=== 完成加载游戏数据 ===")
	
	Fsm.change_state(PlayerTurnState.new())


	var container = get_node("./Map")
	print(container)
	var def1 = load("res://views/card/industry_card_node.tscn")
	var a = def1.instantiate()
	container.add_child(a)
	a.atlas_frame = 1
	a.position = Vector2(100, 100)
	var def2 = load("res://views/card/industry_card_node.tscn")
	var b = def2.instantiate()
	container.add_child(b)
	b.atlas_frame = 2
	b.position = Vector2(300, 300)
	#
	#
	#var cmd = BuildIndustryCommand.new(
	#0,
	#"cotton_mill"
	#)
	#
	#CommandBus.execute_command(cmd)
	#var cmd2 = BuildIndustryCommand.new(
	#0,
	#"iron_works"
	#)
	#CommandBus.execute_command(cmd2)
