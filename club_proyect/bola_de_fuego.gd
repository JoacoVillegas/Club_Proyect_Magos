class_name fireBall
extends Area2D

#@onready var habMago1 = load("res://bola_de_fuego.tscn")
@onready var bolaDeFuego : Area2D = $"."
const habMago1 = preload("res://bola_de_fuego.tscn")

var direction : float
var spawnPos : Vector2
var spawnRot : float
var abilityOwner : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	#target_direction = (destination - global_position).normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
static func create(body: Node2D, main: Node) -> Area2D:
	var abilityInstance = habMago1.instantiate()
	abilityInstance.spawnPos = body.global_position
	abilityInstance.spawnRot = body.global_rotation
	abilityInstance.abilityOwner = body
	 
	return abilityInstance


func _on_body_entered(body: Node2D) -> void:
	if (body != abilityOwner and body.is_class("CharacterBody2D")):
		body.vidaJugador -= 25
		bolaDeFuego.queue_free()
		
