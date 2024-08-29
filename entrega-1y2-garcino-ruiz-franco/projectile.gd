extends Node2D
class_name Projectile

var move_direction

func _ready() -> void:
	set_physics_process(false)

func set_start_position(start: Vector2, direction: Vector2) -> void:
	global_position = start
	move_direction = direction
	set_physics_process(true)

func _physics_process(delta: float) -> void: 
	position += move_direction*300*delta
