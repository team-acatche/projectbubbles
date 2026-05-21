extends Node

@onready var closed_door_sprite = $ClosedDoorSprite
@onready var open_door_sprite = $OpenDoorSprite

func open_door() -> void:
	closed_door_sprite.visible = false
	open_door_sprite.visible = true
	$Interactible.disable()
	
	# todo: perform death animation here
