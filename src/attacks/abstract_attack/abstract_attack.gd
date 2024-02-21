extends Node2D
class_name AbstractAttack

signal new_projectile(projectileClass:String, args:Dictionary)

var targetGroup = AbstractProjectile.targetCharacter
var attackReady:bool = true
var attackTimer:Timer = null

func _ready():
	attackTimer = get_node("AttackTimer")
	attackTimer.timeout.connect(attackTimerTimeout)
	
func init(args:Dictionary) -> AbstractAttack:
	if 'attackSpeed' in args:
		attackTimer.wait_time = args['attackSpeed']
	if 'targetGroup' in args:
		targetGroup = args['targetGroup']
	return self

func _process(delta):
	if Input.is_action_pressed("shoot"):
		ready_attack()

func attackTimerTimeout():
	attackReady = true
	attackTimer.stop()

func ready_attack():
	if attackReady:
		attackTimer.start()
		attackReady = false
		launch_attack()

func launch_attack(): # Abstract
	pass
