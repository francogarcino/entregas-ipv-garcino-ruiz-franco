extends Node
@onready var textureRect = $Background

func _ready() -> void:
	textureRect.size = get_viewport().get_visible_rect().size


func _process(delta: float) -> void:
	pass
