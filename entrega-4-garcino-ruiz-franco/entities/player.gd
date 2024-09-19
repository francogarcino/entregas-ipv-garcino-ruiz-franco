extends CharacterBody2D
class_name Jugador

@export var speed_limit = 500.0
@export var jump_force = 400.0
@export var acceleration = 20.0
@export var friction = 0.1
@export var gravity = 3

@onready var cannon = $Weapon
@onready var bodyAnimation = $BodyAnimations
@onready var body: Sprite2D = $Body

var screen_size
var container: Node

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	# cannon
	cannon.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("click"):
		cannon.shoot()
	
	# movimiento horizontal
	var move_dir = int(Input.is_action_pressed("mover_der")) - int(Input.is_action_pressed("mover_izq"))
	if move_dir != 0:
		velocity.x = clamp(velocity.x + (move_dir * acceleration), -speed_limit, speed_limit)
		body.flip_h = move_dir < 0
	else:
		velocity.x = 0
	
	# salto
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	if !is_on_floor():
		play_animation("Jump")
	elif move_dir != 0:
		play_animation("Walk")
	else:
		play_animation("Idle")
	
	velocity.y += gravity
	move_and_slide()

func set_proj_container(container) -> void:
	cannon.container = container
	container = container

func play_animation(animation: String) -> void:
	if bodyAnimation.has_animation(animation):
		bodyAnimation.play(animation)
