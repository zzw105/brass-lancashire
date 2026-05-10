extends Node

var hover_count: int = 0


func enter_interactive():
	hover_count += 1
	if hover_count == 1:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func exit_interactive():
	hover_count -= 1
	if hover_count == 0:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	elif hover_count < 0:
		# 安全检查，防止逻辑错误导致计数为负
		hover_count = 0
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
