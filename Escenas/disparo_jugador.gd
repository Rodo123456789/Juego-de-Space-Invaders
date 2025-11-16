extends Area2D

var velocidad = 900

func _process(delta: float) -> void:
	position.y -= velocidad*delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemigos"):
		body.eliminacion()
		get_parent().remove_child(self)
		queue_free()
		
	elif body.is_in_group("defensas"):
		body.destruir()
		if !is_queued_for_deletion():
			get_parent().remove_child(self)
			queue_free()
			
	
