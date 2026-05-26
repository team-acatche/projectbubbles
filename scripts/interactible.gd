extends Node2D
class_name Interactible

@export var is_enabled: bool = true
@export var collider_shape: CollisionShape2D

var mouse_is_in_collider: bool = false
var is_clicked: bool = false

signal interacted_with

func _process(_delta: float) -> void:
	var shape = collider_shape.shape
	mouse_is_in_collider = shape.collide(
		Transform2D(0.0, collider_shape.global_position),
		shape,
		Transform2D(0.0, get_global_mouse_position())
	)
	
	if mouse_is_in_collider and is_enabled:
		return Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_is_in_collider and is_enabled:
		is_clicked = true
		interacted_with.emit()

func enable() -> void:
	is_enabled = true

func disable() -> void:
	is_enabled = false
	set_process_input(false)
