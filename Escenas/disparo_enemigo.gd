extends Area2D

var velocidad = 500

func _process(delta: float) -> void:
	position.y += velocidad*delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("nave") or body.is_in_group("defensas"):
		body.destruir()
		queue_free()
