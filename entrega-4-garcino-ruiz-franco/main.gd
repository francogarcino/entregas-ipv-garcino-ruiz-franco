extends Node
@onready var textureRect = $Background

func _ready() -> void:
	$Player.set_proj_container(self)
	$TurretA.set_values(self)
	$Player/Camera2D.zoom = Vector2(2.5, 2.5)
