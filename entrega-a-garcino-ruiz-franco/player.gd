extends Area2D

# export muestra en inspector;
@export var speed = 550
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()

func _process(delta: float) -> void:
	var vector_movimiento = Vector2.ZERO
	if Input.is_action_pressed("mover_derecha"):
		vector_movimiento.x += 1

	if Input.is_action_pressed("mover_izquierda"):
		vector_movimiento.x -= 1

	if Input.is_action_pressed("mover_arriba"):
		vector_movimiento.y -= 1

	if Input.is_action_pressed("mover_abajo"):
		vector_movimiento.y += 1

	if vector_movimiento.length() > 0:
		vector_movimiento = vector_movimiento.normalized() * speed
		# $subnodo
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += vector_movimiento * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if vector_movimiento.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = vector_movimiento.x < 0
	elif vector_movimiento.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = vector_movimiento.y > 0
	
