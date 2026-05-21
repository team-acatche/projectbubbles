extends Control

signal timeout

@onready var timer = $Background/TimerLabel/Timer

func emit_timeout() -> void:
	timeout.emit()

func end() -> void:
	timer.stop()
