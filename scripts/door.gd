extends Node
class_name Door

@onready var closed_door_sprite: Sprite2D = $ClosedDoorSprite
@onready var open_door_sprite: Sprite2D = $OpenDoorSprite

@onready var killer: Killer = $Killer
@export var death_screen: Control

func open_door() -> void:
	closed_door_sprite.visible = false
	open_door_sprite.visible = true
	$Interactible.disable()
	
	# Death Animation
	killer.visible = true
	killer.move_local_y(10)
	killer.play_kill_animation()
	await killer.animation_finished
	death_screen.visible = true
	
	# Reset
	await get_tree().create_timer(1.4).timeout
	get_tree().reload_current_scene()
