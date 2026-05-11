extends BaseState
class_name PlayerTurnState


func enter():
	print("玩家回合开始")

	EventBus.command_executed.connect(on_command_executed)


func exit():
	if EventBus.command_executed.is_connected(on_command_executed):
		EventBus.command_executed.disconnect(on_command_executed)


func on_command_executed(_command):
	GameState.current_player_remaining_actions -= 1

	print("剩余行动:", GameState.current_player_remaining_actions)

	if GameState.current_player_remaining_actions <= 0:
		Fsm.change_state(GameEndState.new())
