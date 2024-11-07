class_name HurtBox
extends Area2D

@onready var parentHurtBox = self.get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_layer = 0
	collision_mask = 2
	area_entered.connect(on_area_entered)

func on_area_entered(ahitBox: HitBox):
	print("ay,me tocaron ", ahitBox.damage)
	if ahitBox == null:
		return
	
	#Comparar padre del hurtBox con el atributo abilityOwner del padre de hitBox
	#print(ahitBox.parentHitBox.abilityOwner)
	#print(parentHurtBox)
	if (ahitBox.parentHitBox.abilityOwner != parentHurtBox):
		#REVISAR, ¿POR QUE NO ME QUITA DAÑO?
		if parentHurtBox.has_method("bajar_dano"):
			print(ahitBox.damage)
			parentHurtBox.bajar_dano(ahitBox.damage, parentHurtBox)
			ahitBox.parentHitBox.queue_free()
