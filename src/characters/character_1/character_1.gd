extends AbstractCharacter

signal new_projectile(projectileClass, args)

@onready var attackTimer = %AttackTimer

func _on_timer_timeout():
	attack_ready = true
	attackTimer.stop()

func shoot():
	attackTimer.start()
	var projectileType = "MagicMissile"
	var projectileArgs = {'position': position, 'speed': 600, 'direction': Vector2(0, -1), 'targetGroup': AbstractProjectile.targetEnemy}
	new_projectile.emit(projectileType, projectileArgs)
