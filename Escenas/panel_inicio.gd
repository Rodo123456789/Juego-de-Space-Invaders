extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/test_1.tscn")


func _on_button_pressed() -> void:
	get_tree().quit()
