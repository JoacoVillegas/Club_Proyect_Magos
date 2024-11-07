class_name HitBox
extends Area2D

@export var damage := 20
@onready var parentHitBox = self.get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_layer = 2
	collision_mask = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
