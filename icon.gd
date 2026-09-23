extends Sprite2D

var rotations_per_second = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(1, 0, 0, 1)
	skew = deg_to_rad(15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = rotation + (2 * PI * delta * rotations_per_second)
