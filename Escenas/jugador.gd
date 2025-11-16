extends CharacterBody2D

var disparo = preload("res://Escenas/disparo_jugador.tscn")

@onready var timer_disparo = $Timer_disparo
@onready var animacion_destruido = $AnimationPlayer

var speed: float = 350.0
var direction: Vector2 = Vector2.ZERO
var acceso_disparo = true

var vidas: int = 4 

func _unhandled_input(_event: InputEvent) -> void:
	# movimiento 
	self.direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")

func _physics_process(_delta: float) -> void:
	# Calcula la posición 
	self.velocity = self.direction * self.speed
	self.move_and_slide()

	if Input.is_action_just_pressed("disparo") and acceso_disparo == true:
		var bullet: Area2D = disparo.instantiate() 
		
		
		bullet.position = self.global_position
		if bullet.has_method("set_direction"):
			bullet.set_direction(self.direction)

		get_parent().add_child(bullet)
		
		acceso_disparo = false
		timer_disparo.start()
		$AudioStreamPlayer.play()

	if self.position.x < 40:
		self.position.x = 40
	elif self.position.x > 850:
		self.position.x = 850

func destruir():
	animacion_destruido.play("eliminado")
	$AudioStreamPlayer2.play()
	vidas -= 1
	if vidas > 0:
		reset_jugador()
		get_parent().vidas_3(vidas)  
	else:
		eliminar_jugador()
		

func reset_jugador():
	self.position = Vector2(440, 960) 
	await get_tree().create_timer(0.5).timeout  
	animacion_destruido.stop()
	animacion_destruido.play("vivo")  

func eliminar_jugador():
	get_tree().change_scene_to_file("res://Escenas/game_over.tscn")

func _on_timer_disparo_timeout() -> void:
	acceso_disparo = true
