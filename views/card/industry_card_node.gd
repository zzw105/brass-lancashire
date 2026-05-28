extends Node2D

@export var flip_duration: float = 0.3

@onready var flip_container: Node2D = $FlipContainer
@onready var front: Sprite2D = $FlipContainer/Front
@onready var back: Sprite2D = $FlipContainer/Back

var is_flipped: bool = false
var is_animating: bool = false

func _ready() -> void:
	show_front()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var size = front.texture.get_size() * scale
			var card_rect = Rect2(global_position - size / 2.0, size)
			if card_rect.has_point(event.position):
				flip()

func flip() -> void:
	if is_animating:
		return
	is_animating = true
	is_flipped = !is_flipped

	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)

	if is_flipped:
		tween.tween_property(flip_container, "scale:x", 0.0, flip_duration / 2.0)
		tween.tween_callback(swap_to_back)
		tween.tween_property(flip_container, "scale:x", -1.0, flip_duration / 2.0)
	else:
		tween.tween_property(flip_container, "scale:x", 0.0, flip_duration / 2.0)
		tween.tween_callback(swap_to_front)
		tween.tween_property(flip_container, "scale:x", 1.0, flip_duration / 2.0)

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