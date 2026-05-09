class_name BaseCommand
extends RefCounted

func validate(state:GameState) -> bool:
	return true

func execute(state:GameState):
	pass

func undo(state:GameState):
	pass
