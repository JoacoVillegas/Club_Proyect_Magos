extends Node2D

@export var tipoOrbe : String
@onready var sprite = $Sprite2D

func setTipoOrbe(typeOrb: String) -> void:
	match typeOrb:
		"mana":
			sprite.frame = 1
		"damage":
			sprite.set_frame(5)
		"speed":
			sprite.set_frame(4)
	tipoOrbe = typeOrb

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setTipoOrbe(tipoOrbe) # Replace with function body.
	print("¡UN orbe ha aparecido!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
