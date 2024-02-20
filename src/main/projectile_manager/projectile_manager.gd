extends Node2D
class_name ProjectileManager

signal new_projectile(projectileClass, args)

func _ready():
	new_projectile.connect(spawn)

func spawn(projectileClass:String, args:Dictionary):
	if projectileClass == "MagicMissile":
		var magicMissile = preload("res://src/projectiles/magic_missile/magic_missile.tscn").instantiate().init(args)
		add_child(magicMissile)
