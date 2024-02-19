extends Node2D
class_name AbstractProjectile

const targetEnemy:String = "targetEnemy"
const targetCharacter:String = "targetCharacter"

@export var speed:float = 100
@export var aiming:float = 1 #A Renommer
var direction:Vector2 = Vector2.ZERO
@export var target:AbstractCharacter = null
var targetGroup:String = targetCharacter
@export var dmg:int = 1

func _ready():
	var collision:Area2D = get_node("Area2D")
	collision.body_entered.connect(on_area_2d_body_entered)

func init(
		p_position:Vector2,
		p_speed:float, 
		p_aiming:float, 
		p_direction:Vector2, 
		p_target:AbstractCharacter,
		p_targetGroup:String,
		) -> AbstractProjectile:
	position = p_position
	speed = p_speed
	aiming = p_aiming
	direction = p_direction
	target=p_target
	targetGroup = p_targetGroup
	return self

func _physics_process(delta) -> void:
	if target != null:
		var current_direction = direction.normalized()
		var target_direction = (target.position - position).normalized()
		direction = target_direction * aiming + current_direction * (1 - aiming)
	position += direction.normalized() * speed * delta

func on_area_2d_body_entered(body):

	if body.is_in_group(targetGroup) && body.has_method("take_damage"):
		print("body entered")
		body.take_damage(dmg)
