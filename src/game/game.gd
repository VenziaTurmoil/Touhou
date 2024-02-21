extends Node2D

@onready var character:AbstractCharacter = %character1
@onready var enemyManager:EnemyManager = %EnemyManager
@onready var projectileManager:ProjectileManager = %ProjectileManager

func _ready():
	var attack = preload("res://src/attacks/character_attacks/straight_line_attack.tscn").instantiate().init({'targetGroup': AbstractProjectile.targetEnemy})
	character.add_child(attack)
	attack.new_projectile.connect(projectileManager.spawn)
	enemyManager.spawn("Roach", {'target': character}) # A changer
