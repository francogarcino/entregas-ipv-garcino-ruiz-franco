extends Node2D

@export var speed = 450
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position.x = screen_size.x / 2
	position.y = screen_size.y * 0.7


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("mover_der"):
		position.x += speed * delta
	if Input.is_action_pressed("mover_izq"):
		position.x -= speed * delta

	position = position.clamp(Vector2.ZERO, screen_size)
