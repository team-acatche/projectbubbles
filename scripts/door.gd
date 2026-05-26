extends Node
class_name Door

@onready var game_manager: GameManager = $"../GameManager"

@onready var closed_door_sprite: Sprite2D = $ClosedDoorSprite
@onready var open_door_sprite: Sprite2D = $OpenDoorSprite

@onready var player: Player = $"../Player"
@onready var killer: Killer = $Killer

@export var death_screen: Control

const KILL_REACTION_TIMEOUT: float = 1
const PLAYER_DEATH_SCREEN_TIMEOUT: float = 1.4
const SHOW_KILLER_DEATH_TIMEOUT: float = 4
var timer: SceneTreeTimer = null

func _process(_delta: float) -> void:
	if timer != null and timer.time_left > 0 and killer.interactible.is_clicked:
		timer = null
		player.visible = false
		kill_killer()
		await get_tree().create_timer(SHOW_KILLER_DEATH_TIMEOUT).timeout
		get_tree().quit()
		return
	
	if timer != null and timer.time_left <= 0 and not killer.interactible.is_clicked:
		kill_player()

func open_door() -> void:
	closed_door_sprite.visible = false
	open_door_sprite.visible = true
	$Interactible.disable()
	
	killer.visible = true
	killer.move_local_y(10)
	
	if not game_manager.could_win():
		kill_player()
		return
	
	killer.enable_death()
	timer = get_tree().create_timer(KILL_REACTION_TIMEOUT)

func kill_player() -> void:
	# Death Animation
	killer.play_kill_animation()
	await killer.animation_finished
	death_screen.visible = true
	
	# Reset
	await get_tree().create_timer(PLAYER_DEATH_SCREEN_TIMEOUT).timeout
	if not is_inside_tree():
		return
	get_tree().reload_current_scene()

func kill_killer() -> void:
	killer.move_local_y(30)
	killer.die()
