extends Node2D
class_name AbstractProjectile

@export var speed:float = 100
@export var aiming:float = 1 #A Renommer
var direction:Vector2 = Vector2.ZERO
@export var target:AbstractCharacter = null

func _physics_process(delta)->void:
	if target != null:
		var current_direction = direction.normalized()
		var target_direction = (target.position - position).normalized()
		direction = target_direction * aiming + current_direction * (1 - aiming)
	position += direction.normalized() * speed * delta

func init(p_speed:float, p_aiming:float, p_direction:Vector2, p_target:AbstractCharacter)->AbstractProjectile:
	speed = p_speed
	aiming = p_aiming
	direction = p_direction
	target=p_target
	return self
