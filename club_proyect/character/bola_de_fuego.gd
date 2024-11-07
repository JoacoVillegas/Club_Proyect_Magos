class_name fireBall
extends CharacterBody2D

#@onready var habMago1 = load("res://bola_de_fuego.tscn")
@onready var animated_sprite = $AnimatedSprite2D
const habMago1 = preload("res://character/bola_de_fuego.tscn")

var direction : float
var spawnPos : Vector2
var spawnRot : float
var abilityOwner : CharacterBody2D
var frame : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	
		#Intento de darle una direccion.
	if abilityOwner.animated_sprite.flip_h == true:
		animated_sprite.flip_h = true
		velocity = Vector2(-50,0)
	else:
		velocity = Vector2(50,0)
	#target_direction = (destination - global_position).normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	
	move_and_slide()
#Creacion de la bola de fuego, Tomando las posiciones actuales de su padre (mago creador)
static func create(body: Node2D, delta: float) -> CharacterBody2D:
	var abilityInstance = habMago1.instantiate()
	abilityInstance.spawnPos = body.global_position
	abilityInstance.spawnRot = body.global_rotation
	abilityInstance.abilityOwner = body
	abilityInstance.frame = delta 
	

	return abilityInstance

#¿esto ya no servira?
func _on_body_entered(body: Node2D) -> void:
	if (body != abilityOwner and body.is_class("CharacterBody2D")):
		body.vidaJugador -= 25
		queue_free()
		
