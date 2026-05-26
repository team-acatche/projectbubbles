extends Node2D
class_name Interactible

@export var collider_shape: CollisionShape2D

var mouse_is_in_collider: bool = false

signal interacted_with

func _process(_delta: float) -> void:
	var shape = collider_shape.shape
	mouse_is_in_collider = shape.collide(
		Transform2D(0.0, collider_shape.global_position),
		shape,
		Transform2D(0.0, get_global_mouse_position())
	)
	
	if mouse_is_in_collider:
		return Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_is_in_collider:
		interacted_with.emit()

func disable() -> void:
	set_process_input(false)
