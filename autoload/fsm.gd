extends Node

var current_state

func change_state(new_state):

	if current_state:
		current_state.exit()

	current_state = new_state

	current_state.fsm = self

	current_state.enter()

	EventBus.phase_changed.emit(
		current_state.get_class()
	)
