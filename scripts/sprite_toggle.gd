extends Sprite2D

@export var alternative_sprite: Sprite2D

func toggle() -> void:
	self.visible = !self.visible;
	alternative_sprite.visible = !alternative_sprite.visible;
