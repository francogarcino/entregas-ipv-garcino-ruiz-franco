extends Node2D
@onready var fire_position = $ShootOrigin

@export var projectile_scene: PackedScene
var bullet_container: Node
var target: Node2D

func _ready() -> void:
	position.x = get_viewport_rect().size.x / 2
	position.y = 30

func set_values(container) -> void:
	bullet_container = container
	$Timer.start()

func _on_timer_timeout() -> void:
	shoot()

func shoot() -> void:
	if target != null:
		var instance = projectile_scene.instantiate()
		bullet_container.add_child(instance)
		var direction = (target.global_position - fire_position.global_position).normalized()
		instance.set_start_position(fire_position.global_position, direction)


func _on_detect_body_entered(body: Node2D) -> void:
	if body is Jugador:
		target = body


func _on_detect_body_exited(body: Node2D) -> void:
	if body is Jugador:
		target = null
