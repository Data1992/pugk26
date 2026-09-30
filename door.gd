extends Node3D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var is_open: bool = false

func open():
	animation_player.play("open")
	is_open = true
	
func close():
	animation_player.play("close")
	is_open = false
	
func toggle():
	if is_open:
		close()
	else:
		open()
