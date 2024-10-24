
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var main = get_tree().get_root().get_node("map1")
@onready var habMago1 = load("res://character/bola_de_fuego.tscn")

@export_range(1,2) var jugador : int

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

#Variables del jugador, vida, mana, tal vez un booleano para indicar que la habilidad aun no puede ser usada
var vidaJugador = 100
var manaJugador1 = 0
var manaJugador2 = 0

var is_teleporting = false  # Nueva variable para controlar si el mago está haciendo "destello"
func get_input():
	var input_dir
	if jugador == 1:
		input_dir = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	
	if jugador == 2:
		input_dir = Input.get_vector("izquierda2", "derecha2", "arriba2", "abajo2")
	velocity = input_dir * SPEED

func _physics_process(delta: float) -> void:
	
	
	get_input()
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("izquierda", "derecha")
	
	var directionX := velocity.x
	var directionY := velocity.y

	# Check for teleportation input
	if directionX > 0:
		animated_sprite.flip_h = false
	elif directionX < 0:
		animated_sprite.flip_h = true
		
	if not (directionX or directionY):
		animated_sprite.play("quieto")
	else:
		if not (is_teleporting):
			animated_sprite.play("movimiento")
	
	if Input.is_action_just_pressed("teleportacion") and (directionX or directionY):
		#Solucionar Bug de colision (se puede meter dentro de un muro(? xD)
		animated_sprite.play("destello")
		is_teleporting = true
		var newPosition
		if directionX and directionY:
			#¿Ver los 4 casos que hay o no?
			if directionX > 0:
				if directionY > 0:
					newPosition = Vector2(50 + self.global_position.x, 50 + self.global_position.y)
				else:
					newPosition = Vector2(50 + self.global_position.x, -50 + self.global_position.y)
			else:
				if directionY > 0:
					newPosition = Vector2(-50 + self.global_position.x, 50 + self.global_position.y)
				else:
					newPosition = Vector2(-50 + self.global_position.x, -50 + self.global_position.y)
		elif directionX:
			if directionX > 0:
				newPosition = Vector2(50 + self.global_position.x, self.global_position.y)
			else:
				newPosition = Vector2(-50 + self.global_position.x, self.global_position.y)
		else:
			if directionY > 0:
				newPosition = Vector2(self.global_position.x, 50 + self.global_position.y)
			else:
				newPosition = Vector2(self.global_position.x, -50 + self.global_position.y)
		self.set_global_position(newPosition)
	move_and_slide()
	
	if Input.is_action_just_pressed("habilidad"):
		throw_Ability1(delta)

func throw_Ability1(delta: float) -> void:
	if self.manaJugador1 >= 50:
		self.manaJugador1 -= 50
		var habilidad = fireBall.create(self, delta)
		
		main.add_child(habilidad)
	else:
		#TODO: impletar mana
		print("¡Necesito mas mana!")


func _on_area_2d_body_entered(body: Node2D) -> void:
	 # Replace with function body.
	pass
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "destello":
		
		is_teleporting = false
		
		if (velocity.x != 0) or (velocity.y != 0):
			animated_sprite.play("movimiento")
		else:
			animated_sprite.play("quieto")
	
