extends Node2D

var timeNewOrbe = 30
var createJustOne = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not (createJustOne):
		generar_orbe()
		createJustOne = true
	

func generar_orbe() -> void:
	var orbeEscena = load("res://orbe.tscn")
	var newOrbe = orbeEscena.instantiate()
	
	newOrbe.tipoOrbe = "mana"
	#¿Por que aparece error? ¿No llama al constructor _init con el parametro adecuado?
	#var newOrbe = orbeEscena.instantiate(tOrb)
	
	
	var posX = 0
	var posY = 0
	var position = Vector2(posX, posY)
	newOrbe.set_global_position(position)
	
	add_child(newOrbe)
