extends Node2D
class_name Killer

@onready var killer_sprite: AnimatedSprite2D = $KillerSprite

signal animation_finished

func play_kill_animation() -> void:
	killer_sprite.play("kill")
	await killer_sprite.animation_finished
	animation_finished.emit()
