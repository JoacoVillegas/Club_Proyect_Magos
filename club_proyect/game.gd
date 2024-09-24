extends Node2D

var timeNewOrbe = 30
var createJustOne = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func generar_orbe() -> void:
	var orbeEscena = load("res://orbe.tscn")
	var newOrbe = orbeEscena.instantiate()
	
	newOrbe.tipoOrbe = "mana"
	#¿Por que aparece error? ¿No llama al constructor _init con el parametro adecuado?
	#var newOrbe = orbeEscena.instantiate(tOrb)
	
	var rng = RandomNumberGenerator.new()
	
	
	var posX = rng.randf_range(-300, 300)
	var posY = rng.randf_range(-300, 100)
	var position = Vector2(posX, posY)
	newOrbe.set_global_position(position)
	
	add_child(newOrbe)


func _on_orb_timer_timeout() -> void:
	generar_orbe()
	pass # Replace with function body.
