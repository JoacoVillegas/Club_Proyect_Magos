extends Node2D

@export var tipoOrbe : String
@onready var sprite = $Sprite2D
@onready var area2d = $Area2D

signal collisionMap

func setTipoOrbe(typeOrb: String) -> void:
	#match typeOrb:
		#"mana":
			#sprite.frame = 1
			
		#"damage":
			#sprite.set_frame(5)
		#"speed":
			#sprite.set_frame(4)
	tipoOrbe = typeOrb

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setTipoOrbe(tipoOrbe) # Replace with function body.
	

		
func reposition_orb() -> void:
	var rng = RandomNumberGenerator.new()
	var posX = rng.randf_range(-300, 300)
	var posY = rng.randf_range(-300, 100)
	self.global_position = Vector2(posX,posY)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_collision_tile_map() -> void:
	reposition_orb()
