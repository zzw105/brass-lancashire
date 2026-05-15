extends Node

enum GlobalEvent {
	LOAD_DEFINITIONS_COMPLETE
}
signal state_changed
signal command_executed(command)
signal phase_changed(state_name)

signal global_event_changed(event: GlobalEvent)
