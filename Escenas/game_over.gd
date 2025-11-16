extends Control


func _on_button_reintwntar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/test_1.tscn")


func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/panel_inicio.tscn")
