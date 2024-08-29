extends Node
@onready var textureRect = $Background

func _ready() -> void:
	textureRect.size = get_viewport().get_visible_rect().size
	$Player.set_proj_container(self)
