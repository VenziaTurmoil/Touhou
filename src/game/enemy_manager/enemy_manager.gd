extends Node2D
class_name EnemyManager

func spawn(enemyClass:String, args:Dictionary):
	if enemyClass == "Roach":
		var roach = preload("res://src/enemies/roach/roach.tscn").instantiate().init(args)
		add_child(roach)
