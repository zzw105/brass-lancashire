extends Node


func _ready():
	GameState.setup()

	Fsm.change_state(PlayerTurnState.new())
	DataManager.load_definitions()

	print(DataManager.get_area("derby_area_1").can_industry_ids)

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
