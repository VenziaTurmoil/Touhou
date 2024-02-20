extends AbstractEnemy
class_name Roach

@export var speed:float = 150
@export var aiming:float = 0.5 #A Renommer
var direction:Vector2 = Vector2.ZERO
@export var target:AbstractCharacter = null

func _physics_process(delta) -> void:
	if target != null:
		var current_direction = direction.normalized()
		var target_direction = (target.position - position).normalized()
		direction = target_direction * aiming + current_direction * (1 - aiming)
	position += direction.normalized() * speed * delta
	#Remplacer par move and slide

func init(args:Dictionary) -> Roach:
	if 'speed' in args:
		speed = args['speed']
	if 'aiming' in args:
		aiming = args['aiming']
	if 'position' in args:
		position = args['position']
	if 'direction' in args:
		direction = args['direction']
	if 'target' in args:
		target = args['target']
	return self
