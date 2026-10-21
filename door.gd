extends Node3D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var is_open: bool = false

func _ready() -> void:
	print("ready door")
	
func update_state() -> void:
	if is_open:
		open()
	else:
		close()
	animation_player.seek(animation_player.current_animation_length)

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
