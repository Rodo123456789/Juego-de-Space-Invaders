extends Node2D

var puntos = 0
var vidas = 4
@onready var puntaje_obtenido = $puntaje/VBoxContainer/puntaje
@onready var vidas_restantes = $puntaje/VBoxContainer2/vidas


func puntaje_1(_A):
	puntos += 10
	puntaje_obtenido.text = str(puntos)
	
	
func puntaje_2(_A):
	puntos += 20
	puntaje_obtenido.text = str(puntos)
	

func puntaje_3(_A):
	puntos += 30
	puntaje_obtenido.text = str(puntos)
	
func puntaje_4(_A):
	var valores = [40, 50, 60, 70] 
	var puntos_aleatorios = valores[randi() % valores.size()] 
	puntos += puntos_aleatorios 
	puntaje_obtenido.text = str(puntos) 
	
	
func vidas_3(_A):
	vidas -= 1
	vidas_restantes.text = str(vidas)
	

	
	
