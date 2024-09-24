extends Area2D

@onready var orbe: Node2D = $".."


func _on_body_entered(body: Node2D) -> void:
	if body.jugador == 1:
		
		body.manaJugador1 += 10
	else:
		body.manaJugador2 += 10
	orbe.queue_free()
