extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export_range(1,2) var jugador : int

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


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
	var direction := velocity.x


	# Check for teleportation input
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0:
		animated_sprite.play("quieto")
	else:
		animated_sprite.play("movimiento")
	
	if Input.is_action_just_pressed("teleportacion") and (direction < 0 or direction > 0):
		animated_sprite.play("destello")
	
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	 # Replace with function body.
	print("SI LEES ESTO, ENTONCES EL MAGO SABE LEER CARTELES.")
