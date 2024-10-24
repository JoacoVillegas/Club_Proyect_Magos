class_name HurtBox
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_layer = 0
	collision_mask = 2
	area_entered.connect(on_area_entered)

func on_area_entered(ahitBox: HitBox):
	if ahitBox == null:
		return
	print("ay,me tocaron ", ahitBox.damage)
