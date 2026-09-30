extends Node3D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var is_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	open()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
