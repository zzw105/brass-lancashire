class_name BaseCommand
extends RefCounted

func validate(state) -> bool:
	return true

func execute(state):
	pass

func undo(state):
	pass
