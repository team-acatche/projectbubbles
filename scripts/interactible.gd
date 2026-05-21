extends Node2D

@export var collider_shape: CollisionShape2D

signal interacted_with

func _input(event: InputEvent) -> void:
	var shape = collider_shape.shape
	var mouse_is_in_collider = shape.collide(
		Transform2D(0.0, collider_shape.global_position),
		shape,
		Transform2D(0.0, get_global_mouse_position())
	)
	
	if event.is_action_pressed("click") and mouse_is_in_collider:
		interacted_with.emit()

func disable() -> void:
	set_process_input(false)
