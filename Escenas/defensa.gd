extends StaticBody2D

var daño = 0

@onready var animacion_defensas = $AnimationPlayer

func _ready() -> void:
	comprobar_daño()

func destruir():
	daño += 1
	comprobar_daño()
	
func comprobar_daño():
	if daño == 0:
		animacion_defensas.play("completo")
	elif daño == 1:
		animacion_defensas.play("dañado")
	elif daño == 2:
		queue_free()
