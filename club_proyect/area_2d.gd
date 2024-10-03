extends Area2D

@onready var orbe: Node2D = $".."

signal collisionTileMap
#Se genera un bug que le suma otros 10 si ambos magos tocan al mismo tiempo un orbe.

func _on_body_entered(body: Node2D) -> void:
	if body.is_class("TileMapLayer"):
		emit_signal("collisionTileMap")

	if body.is_class("CharacterBody2D"):
		if body.jugador == 1:
		
			body.manaJugador1 += 10
		else:
			print("Wow MAGO2 eres pro")
			body.manaJugador2 += 10
		orbe.queue_free()
	
