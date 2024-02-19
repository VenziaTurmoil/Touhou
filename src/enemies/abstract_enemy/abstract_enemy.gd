extends Node2D
class_name AbstractEnemy

@export var speed:float = 100
@export var aiming:float = 1 #A Renommer
var direction:Vector2 = Vector2.ZERO
var target:AbstractCharacter = null

func _physics_process(delta):
	if target != null:
		var current_direction = direction
		var target_direction = target.position - position
		direction = target_direction * aiming + current_direction * (1 - aiming)
	position += direction.normalized() * speed * delta
