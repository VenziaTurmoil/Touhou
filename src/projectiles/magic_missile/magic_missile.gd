extends AbstractProjectile
class_name MagicMissile

@export var aiming:float = 0.01
@export var target:CharacterBody2D = null

func init(args:Dictionary) -> MagicMissile:
	super.init(args)
	if 'aiming' in args:
		aiming = args['aiming']
	if 'target' in args:
		target = args['target']
	return self

func _physics_process(delta) -> void:
	if target != null:
		var current_direction = direction.normalized()
		var target_direction = (target.position - position).normalized()
		direction = target_direction * aiming + current_direction * (1 - aiming)
	position += direction.normalized() * speed * delta
