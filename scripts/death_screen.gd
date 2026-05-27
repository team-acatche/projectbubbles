extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_viewport_size_changed()
	get_viewport().size_changed.connect(_on_viewport_size_changed)

func _on_viewport_size_changed():
	set_deferred("size", get_viewport_rect().size)
