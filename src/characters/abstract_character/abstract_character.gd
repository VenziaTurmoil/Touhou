extends CharacterBody2D
class_name AbstractCharacter

@export var speed:float = 300
@export var attacks:Array[AbstractAttack] = []

func _physics_process(delta) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed(("character_up")):
		direction.y += -1
	if Input.is_action_pressed(("character_down")):
		direction.y += 1
	if Input.is_action_pressed(("character_left")):
		direction.x += -1
	if Input.is_action_pressed(("character_right")):
		direction.x += 1

	velocity = direction.normalized() * speed
	move_and_slide()

func lose_player_health() -> void:
	queue_free()
	
func shoot() -> void:
	pass

func add_attack(attack: AbstractAttack, projectileManager: ProjectileManager) -> void:
	attacks.append(attack)
	add_child(attack)
	attack.new_projectile.connect(projectileManager.spawn)

func rm_attack(attack: AbstractAttack) -> void:
	if attack in attacks:
		attacks.erase(attack)
		attack.queue_free()
