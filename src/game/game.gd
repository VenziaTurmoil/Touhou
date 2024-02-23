extends Node2D

@onready var character:AbstractCharacter = %character1
@onready var enemyManager:EnemyManager = %EnemyManager
@onready var projectileManager:ProjectileManager = %ProjectileManager
@onready var gameZone:Area2D = %Area2D

func _ready():
	gameZone.area_exited.connect(call_out_of_bounds)
	
	var attack = preload("res://src/attacks/character_attacks/straight_line_attack.tscn").instantiate().init({'targetGroup': AbstractProjectile.targetEnemy})
	character.add_attack(attack, projectileManager)
	enemyManager.spawn("Roach", {'target': character}) # A changer


func call_out_of_bounds(body):
	if body.has_method("out_of_bounds"):
		body.out_of_bounds()
