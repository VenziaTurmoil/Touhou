extends Node2D

@onready var character:AbstractCharacter = %character1
@onready var enemyManager:EnemyManager = %EnemyManager
@onready var projectileManager:ProjectileManager = %ProjectileManager

func _ready():
	character.new_projectile.connect(projectileManager.spawn)
	
	
	enemyManager.spawn("Roach", {'target': character}) # A changer
