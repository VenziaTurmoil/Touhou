extends Node2D
class_name EnemyManager

func spawn(enemyClass:String, args:Array) -> bool:
	if enemyClass == "Roach":
		return true
	else:
		return false
