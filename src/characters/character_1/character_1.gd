extends AbstractCharacter

signal new_projectile(proj)

func _on_timer_timeout():
	var proj:AbstractProjectile = preload("res://src/projectiles/abstract_projectile/abstract_projectile.tscn").instantiate()
	proj.init(position, 600, 0, Vector2(0, -1), null, AbstractProjectile.targetEnemy)
	new_projectile.emit(proj)
