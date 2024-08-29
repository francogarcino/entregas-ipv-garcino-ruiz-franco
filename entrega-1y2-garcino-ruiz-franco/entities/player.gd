extends Node2D

@export var speed = 450
@onready var cannon = $Hand
var screen_size
var container: Node

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position.x = screen_size.x / 2
	position.y = screen_size.y * 0.7


func _process(delta: float) -> void:
	if Input.is_action_pressed("mover_der"):
		position.x += speed * delta
	if Input.is_action_pressed("mover_izq"):
		position.x -= speed * delta
		
	position = position.clamp(Vector2.ZERO, screen_size)
	cannon.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("click"):
		cannon.shoot()


func set_proj_container(container) -> void:
	cannon.container = container
	container = container
