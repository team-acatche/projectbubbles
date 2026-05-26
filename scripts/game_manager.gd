extends Node
class_name GameManager

@onready var headlamp: Interactible = $"../Headlamp/Interactible"
@onready var outlet: Interactible = $"../Outlet/Interactible"

func could_win() -> bool:
	return headlamp.is_clicked and outlet.is_clicked
