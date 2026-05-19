extends Node2D
class_name LightToggleProperty

@export var light: Light2D
@export var collider: CollisionShape2D

func _input(event: InputEvent) -> void:
	var shape = collider.shape
	var mouse_is_in_collider = shape.collide(
		Transform2D(0.0, collider.global_position),
		shape,
		Transform2D(0.0, get_global_mouse_position())
	)
	
	if event.is_action_pressed("click") and mouse_is_in_collider:
		light.enabled = !light.enabled
