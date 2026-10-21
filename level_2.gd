extends Node3D

## Dateipfad für Level-Zustand
const STATE_FILE: String = "user://level_state.json"

## Alle Türen, deren Zustand gespeichert werden kann
var doors: Array[Node]
## Level-Zustand, wird im Nutzer-Ordner gespeichert 
var level_state = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Türen aus der Szene abrufen, wichtig: Elemente
	# müssen der Szenen-Gruppe "doors" zugewiesen sein
	doors = get_tree().get_nodes_in_group("doors")
	# Gespeicherten Level-Zustand laden
	load_level_state()
	# Level-Zustand auf Türen anwenden
	for door in doors:
		if level_state.has(door.name):
			var door_is_open = level_state.get(door.name)
			door.set_open(door_is_open)

func _on_save_button_pressed() -> void:
	# Türen in Level-Zustand übertragen
	for door in doors:
		var door_is_open = door.is_open()
		level_state.set(door.name, door_is_open)
	# Level-Zustand speichern
	save_level_state()

## Gespeicherten Level-Zustand laden
func load_level_state() -> void:
	var file = FileAccess.open(STATE_FILE, FileAccess.READ)
	# Existiert die Datei?
	if file:
		var json = file.get_as_text()
		var state = JSON.parse_string(json)
		# Beinhaltet die Datei wirklich JSON?
		if state:
			level_state = state

## Level-Zustand speichern
func save_level_state() -> void:
	var file = FileAccess.open(STATE_FILE, FileAccess.WRITE_READ)
	file.store_string(JSON.stringify(level_state))
	file.close()
