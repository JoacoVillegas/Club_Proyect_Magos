extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var animated_sprite = $AnimatedSprite2D
var is_teleporting = false  # Nueva variable para controlar si el mago está haciendo "destello"
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * SPEED
	
func _physics_process(delta: float) -> void:
	# Add the gravity.

	get_input()
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("izquierda", "derecha")
	
	if Input.is_action_pressed("arriba"):
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("abajo"):
		velocity.y = -JUMP_VELOCITY

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
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	 # Replace with function body.
	print("SI LEES ESTO, ENTONCES EL MAGO SABE LEER CARTELES.")
