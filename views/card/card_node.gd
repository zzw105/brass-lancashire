extends Node2D
class_name CardNode

@onready var flip_container: Node2D = $FlipContainer
@onready var front: Sprite2D = $FlipContainer/Front
@onready var back: Sprite2D = $FlipContainer/Back

@export var flip_duration: float = 0.3
@export var atlas_frame: int = 1

var is_flipped: bool = false
var is_animating: bool = false

func _input(event: InputEvent) -> void:
	if Engine.is_editor_hint():
		return
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if _is_point_on_card(get_global_mouse_position()):
				flip()


func _is_point_on_card(point: Vector2) -> bool:
	if not front.texture:
		return false
	var local_point = to_local(point)
	var frame_size = front.texture.get_size() / Vector2(front.hframes, front.vframes)
	var half = frame_size / 2.0
	return abs(local_point.x) <= half.x and abs(local_point.y) <= half.y


func flip() -> void:
	if is_animating:
		return
	is_animating = true
	is_flipped = !is_flipped

	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	var half = flip_duration / 2.0

	tween.tween_property(flip_container, "scale:x", 0.0, half)
	tween.tween_callback(swap_to_back if is_flipped else swap_to_front)
	tween.tween_property(flip_container, "scale:x", 1.0, half)
	tween.tween_callback(func(): is_animating = false)


func swap_to_back() -> void:
	front.visible = false
	back.visible = true


func swap_to_front() -> void:
	back.visible = false
	front.visible = true


func show_front() -> void:
	front.visible = true
	back.visible = false
	flip_container.scale.x = 1.0


func show_back() -> void:
	front.visible = false
	back.visible = true
	flip_container.scale.x = 1.0
