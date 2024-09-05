extends Node
@onready var textureRect = $Background

func _ready() -> void:
	$Player.set_proj_container(self)
	$TurretA.set_values(self)
