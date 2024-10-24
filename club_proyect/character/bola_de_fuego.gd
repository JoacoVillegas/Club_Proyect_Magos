class_name fireBall
extends CharacterBody2D

#@onready var habMago1 = load("res://bola_de_fuego.tscn")

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
	velocity = Vector2(1,0)
	#target_direction = (destination - global_position).normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#if velocity.x > 0:
		#velocity = velocity * 50
	#else:
		#velocity = velocity * -50
	
	move_and_slide()

static func create(body: Node2D, delta: float) -> CharacterBody2D:
	var abilityInstance = habMago1.instantiate()
	abilityInstance.spawnPos = body.global_position
	abilityInstance.spawnRot = body.global_rotation
	abilityInstance.abilityOwner = body
	abilityInstance.frame = delta 
	
	#if abilityInstance.abilityOwner.animated_sprite.flip_h == true:
		#abilityInstance.velocity = Vector2(-50,0)
	#else:
		#abilityInstance.velocity = Vector2(50,0)
	return abilityInstance


func _on_body_entered(body: Node2D) -> void:
	if (body != abilityOwner and body.is_class("CharacterBody2D")):
		body.vidaJugador -= 25
		queue_free()
		
