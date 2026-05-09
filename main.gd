extends Node

func _ready():
	
	GameState.setup()

	Fsm.change_state(
		PlayerTurnState.new()
	)


	var cmd = BuildIndustryCommand.new(
		0,
        "cotton_mill"
	)

	CommandBus.execute_command(cmd)

	var cmd2 = BuildIndustryCommand.new(
		0,
        "iron_works"
	)

	CommandBus.execute_command(cmd2)
