extends Node3D

@onready var door: Node3D = $Door

# get-set-Paar

func is_open() -> bool:
	return door.is_open
	
func set_open(is_open: bool) -> void:
	door.is_open = is_open
	door.update_state()
