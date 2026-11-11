extends Node2D

@onready var foreground: Sprite2D = %Foreground
@onready var card_name: Label = %CardName
@onready var health: Label = %Health

@export var data: CardResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data:
		card_name.text = data.card_name
		health.text = var_to_str(data.health)
		foreground.texture = data.foreground
