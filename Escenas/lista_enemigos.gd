extends Node2D

var Enemigo_1 = preload("res://Escenas/enemigo_1.tscn")
var Enemigo_2 = preload("res://Escenas/enemigo_2.tscn")
var Enemigo_3 = preload("res://Escenas/enemigo_3.tscn")
var Enemigo_4 = preload("res://Escenas/enemigo_4.tscn")

@onready var timerdisparo_enemigo = $TimerDisparo_enemigo

var lista_enemigos = []
var enemigos_restantes = 55

func _ready() -> void:
	for B in range(2):
		lista_enemigos.append([]) 
		for A in range(11):
			var enemigo_1 = Enemigo_1.instantiate()
			enemigo_1.global_position = Vector2(84 + 72 * A, 350 + 60 * B)
			self.add_child(enemigo_1)
			lista_enemigos[B].append(enemigo_1)
			enemigo_1.enemigo_eliminado.connect(self.destruir_enemigo)
			enemigo_1.enemigo_eliminado.connect(Callable(get_parent(), "puntaje_1"))
	
	for B in range(2):
		lista_enemigos.append([]) 
		for A in range(11):
			var enemigo_2 = Enemigo_2.instantiate()
			enemigo_2.global_position = Vector2(84 + 72 * A, 210 + 60 * B)
			self.add_child(enemigo_2)
			lista_enemigos[B].append(enemigo_2)
			enemigo_2.enemigo_eliminado.connect(self.destruir_enemigo)
			enemigo_2.enemigo_eliminado.connect(Callable(get_parent(), "puntaje_2"))
	
	for B in range(1):
		lista_enemigos.append([]) 
		for A in range(11):
			var enemigo_3 = Enemigo_3.instantiate()
			enemigo_3.global_position = Vector2(84 + 72 * A, 140 + 60 * B)
			self.add_child(enemigo_3)
			lista_enemigos[B].append(enemigo_3)
			enemigo_3.enemigo_eliminado.connect(self.destruir_enemigo)
			enemigo_3.enemigo_eliminado.connect(Callable(get_parent(), "puntaje_3"))
	
	for A in range(4):
		var enemigo_4 = Enemigo_4.instantiate()
		enemigo_4.global_position = Vector2(1 - 4000 * A, 75)
		self.add_child(enemigo_4)
		enemigo_4.enemigo_eliminado.connect(self.destruir_enemigo_4)
		enemigo_4.enemigo_eliminado.connect(Callable(get_parent(), "puntaje_4"))

	print_enemigos_restantes()

func destruir_enemigo(_a):
	enemigos_restantes -= 1
	print_enemigos_restantes()
	verificar_victoria()

func destruir_enemigo_4(_a):
	print("Enemigo 4 destruido, pero no se cuenta para el marcador.")
	_a.queue_free()

func print_enemigos_restantes() -> void:
	print("Enemigos por destruir: " + str(enemigos_restantes))

func verificar_victoria() -> void:
	if enemigos_restantes == 0:
		cambiar_a_victoria()

func cambiar_a_victoria() -> void:
	get_tree().change_scene_to_file("res://Escenas/victoria.tscn")

func _on_timer_disparo_enemigo_timeout() -> void:
	var lista_enemigos_restantes = []
	for fila in lista_enemigos:
		for A in fila:
			if is_instance_valid(A) and !A.is_queued_for_deletion():
				lista_enemigos_restantes.append(A)
				
	if lista_enemigos_restantes:
		var indice = int(floor(randf_range(0, len(lista_enemigos_restantes) - 1)))
		lista_enemigos_restantes[indice].disparar()
		timerdisparo_enemigo = randf_range(15, 20)

func _on_timer_enemigo_4_timeout() -> void:
	var enemigo_4 = Enemigo_4.instantiate()
	self.add_child(enemigo_4)
