extends CharacterBody2D
class_name AbstractEnemy

@export var health:int = 1

func take_damage(dmg:int) -> void:
	health -= dmg
	if health < 0:
		queue_free()
