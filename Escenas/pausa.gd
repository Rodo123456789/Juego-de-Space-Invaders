extends Node

var pause_scene: PackedScene = preload("res://Escenas/escena_pausa.tscn")

var pause_scene_instance: Node = null

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			pause_scene_instance = pause_scene.instantiate()
			add_child(pause_scene_instance)
		else:
			if pause_scene_instance and pause_scene_instance.is_inside_tree():
				pause_scene_instance.queue_free()
