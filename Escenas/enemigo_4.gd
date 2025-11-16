extends CharacterBody2D

var disparo_enemigo = preload("res://Escenas/disparo_enemigo.tscn")

@onready var animacion_eliminacion = $AnimationPlayer
@onready var marker2d = $Marker2D

var velocidad = 150

signal enemigo_eliminado


func eliminacion():
	animacion_eliminacion.play("eliminado")
	$AudioStreamPlayer.play()

func desaparecer():
	emit_signal("enemigo_eliminado",self)
	get_parent().remove_child(self)
	queue_free()
	
func _process(delta: float) -> void:
	position.x += velocidad * delta

	
func disparar():
	var disparo = disparo_enemigo.instantiate()
	disparo.global_position = marker2d.global_position
	get_parent().add_child(disparo) 
