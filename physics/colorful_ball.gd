extends RigidBody3D
@onready var object: MeshInstance3D = $Object

func _ready() -> void:
	randomize()

func _on_body_entered(body: Node) -> void:
	# Standardmaterial anlegen
	var material = StandardMaterial3D.new()
	# Zufallsfarbe erzeugen
	var color = Color(randf(), randf(), randf())
	# Farbwert an Albedo (Materialfarbe) zuweisen
	material.albedo_color = color
	# andere Werte per Zufall ändern
	material.metallic = randf()
	material.roughness = randf()
	# Material des Objekts überschreiben
	object.material_override = material
