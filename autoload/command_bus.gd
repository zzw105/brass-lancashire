extends Node

var history = []

func execute_command(command):

	if !command.validate(GameState):

		print("非法命令")
		return false

	command.execute(GameState)

	history.append(command)

	EventBus.command_executed.emit(command)
	EventBus.state_changed.emit()

	return true
