extends Sprite2D
@onready var fire_position = $ShootOrigin

@export var projectile_scene: PackedScene
var container:Node

func shoot() -> void:
	var instance = projectile_scene.instantiate()
	container.add_child(instance)
	var direction = (fire_position.global_position - global_position).normalized()
	instance.set_start_position(fire_position.global_position, direction)
