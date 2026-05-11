extends Node


func _ready():
	print("=== 游戏启动 ===")

	print("=== 开始加载静态数据 ===")
	DataManager.load_definitions()
	print("=== 完成加载静态数据 ===")

	print(DataManager.areas)

	print("=== 开始加载游戏数据 ===")
	GameState.setup()
	print("=== 完成加载游戏数据 ===")
	
	Fsm.change_state(PlayerTurnState.new())

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
