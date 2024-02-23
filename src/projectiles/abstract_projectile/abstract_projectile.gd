extends Area2D
class_name AbstractProjectile

const targetEnemy:String = "targetEnemy"
const targetCharacter:String = "targetCharacter"

@export var speed:float = 100
var direction:Vector2 = Vector2.ZERO
@export var targetGroup:String = targetCharacter
@export var damage:int = 1

func _ready():
	body_entered.connect(on_area_2d_body_entered)

func init(args: Dictionary) -> AbstractProjectile:
	if 'position' in args:
		position = args['position']
	if 'speed' in args:
		speed = args['speed']
	if 'direction' in args:
		direction = args['direction']
	if 'targetGroup' in args:
		targetGroup = args['targetGroup']
	if 'damage' in args:
		damage = args['damage']
	return self

func on_area_2d_body_entered(body):
	if body.has_method("take_damage") && body.is_in_group(targetGroup):
		body.take_damage(damage)
		queue_free()

func out_of_bounds():
	print("projectile oob")
	queue_free()
