extends Node2D
@onready var fire_position = $ShootOrigin

@export var projectile_scene: PackedScene
var bullet_container: Node
var player_ref

func _ready() -> void:
	position.x = get_viewport_rect().size.x / 2
	position.y = 30

func set_values(player, container) -> void:
	player_ref = player
	bullet_container = container
	$Timer.start()

func _on_timer_timeout() -> void:
	shoot()

func shoot() -> void:
	var instance = projectile_scene.instantiate()
	bullet_container.add_child(instance)
	var direction = (player_ref.global_position - fire_position.global_position).normalized()
	instance.set_start_position(fire_position.global_position, direction)
