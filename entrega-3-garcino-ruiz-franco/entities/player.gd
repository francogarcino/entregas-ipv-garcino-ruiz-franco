extends CharacterBody2D
class_name Jugador

@export var speed_limit = 500.0
@export var jump_force = 400.0
@export var acceleration = 20.0
@export var friction = 0.1
@export var gravity = 3

@onready var cannon = $Hand

var screen_size
var container: Node

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position.x = screen_size.x / 2
	position.y = screen_size.y * 0.7


func _process(delta: float) -> void:
	# cannon
	cannon.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("click"):
		cannon.shoot()
	
	# movimiento horizontal
	var move_dir = int(Input.is_action_pressed("mover_der")) - int(Input.is_action_pressed("mover_izq"))
	if move_dir != 0:
		velocity.x = clamp(velocity.x + (move_dir * acceleration), -speed_limit, speed_limit)
	else:
		velocity.x = 0
	
	# salto
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	velocity.y += gravity
	
	move_and_slide()

func set_proj_container(container) -> void:
	cannon.container = container
	container = container
