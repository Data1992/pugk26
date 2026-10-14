extends Node3D

@onready var interactive_door: Node3D = %InteractiveDoor
@onready var interactive_door_2: Node3D = %InteractiveDoor2

var level_state = {
	"is_door_1_open": "",
	"is_door_2_open": "",
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("user://level_state.json", FileAccess.READ)
	var json = file.get_as_text()
	level_state = JSON.parse_string(json)
	print(level_state.is_door_1_open)
	print(level_state.is_door_2_open)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_save_button_pressed() -> void:
	var file = FileAccess.open("user://level_state.json", FileAccess.WRITE_READ)
	file.store_string(JSON.stringify(level_state))
	file.close()
	print("saved")
	
