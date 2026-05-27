extends Node2D
class_name Killer

@onready var killer_sprite: AnimatedSprite2D = $KillerSprite
@onready var interactible: Interactible = $Interactible
@onready var death_sprite: Sprite2D = $DeadKillerSprite

@onready var collider: CollisionShape2D = $KillerBody/KillerCollider

@export var death_screen: Control

var is_clicked: bool = false

signal animation_finished

func play_kill_animation() -> void:
	killer_sprite.play("kill")
	await killer_sprite.animation_finished
	animation_finished.emit()

func enable_death() -> void:
	collider.visible = true
	interactible.is_enabled = true

func die() -> void:
	death_screen.visible = true
	await get_tree().create_timer(1.4).timeout
	death_screen.visible = false
	
	killer_sprite.visible = false
	death_sprite.visible = true
	
	await get_tree().create_timer(3).timeout
	animation_finished.emit()
