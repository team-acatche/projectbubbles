extends Node2D
class_name Player

@onready var base_sprite: Sprite2D = $PlayerSprite
@onready var holding_bat_sprite: Sprite2D = $PlayerWithBatSprite

func equip_bat() -> void:
	holding_bat_sprite.visible = true
	base_sprite.visible = false
