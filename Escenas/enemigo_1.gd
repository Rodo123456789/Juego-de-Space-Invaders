extends CharacterBody2D

var disparo_enemigo = preload("res://Escenas/disparo_enemigo.tscn")
@onready var timer_1 = $Timer_1
@onready var timer_2 = $Timer_2
@onready var animacion_eliminacion = $AnimationPlayer
@onready var marker2d = $Marker2D

var origen = 0
var rango = 30
var movimiento = 7
var direccion = 1
var movimiento_vertical = 20

signal enemigo_eliminado

func _ready() -> void:
	timer_1.start()
	origen = self.position.x

func _on_timer_1_timeout() -> void:
	self.position.x += movimiento * direccion
	if self.position.x >= rango + origen or self.position.x < origen - rango:
		direccion *= -1

func eliminacion():
	animacion_eliminacion.play("destruido")
	$AudioStreamPlayer.play()

func desaparecer():
	emit_signal("enemigo_eliminado",self)
	get_parent().remove_child(self)
	queue_free()

func _on_timer_2_timeout() -> void:
	self.position.y += movimiento_vertical
	
func disparar():
	var disparo = disparo_enemigo.instantiate()
	disparo.global_position = marker2d.global_position
	get_parent().add_child(disparo) 
	
 
func _on_enemigo_eliminado() -> void:
	pass # Replace with function body.
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("nave"):
		body.destruir()
		queue_free()
