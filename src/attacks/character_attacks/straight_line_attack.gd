extends AbstractAttack
class_name StraightLineAttack

@export var width:float = 100
@export var speed:float = 800

func init(args:Dictionary) -> StraightLineAttack:
	super.init(args)
	if 'width' in args:
		width = args['width']
	if 'speed' in args:
		speed = args['speed']
	return self

func launch_attack():
	var args1 = {
		'position': global_position,
		'direction': Vector2(0, -1),
		'targetGroup': targetGroup,
		'damage': 1
	}
	var args2 = args1.duplicate(true)
	args2['position'].x -= width/2
	var args3 = args1.duplicate(true)
	args3['position'].x += width/2
	args1['position'].y -= width
	new_projectile.emit("MagicMissile", args1)
	new_projectile.emit("MagicMissile", args2)
	new_projectile.emit("MagicMissile", args3)
