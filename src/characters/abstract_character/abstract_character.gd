extends CharacterBody2D
class_name AbstractCharacter

@export var speed:float = 300.0
var attack_ready = true

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
	if attack_ready and Input.is_action_pressed("shoot"):
		attack_ready = false
		shoot()

	velocity = direction.normalized() * speed
	move_and_slide()

func lose_player_health() -> void:
	queue_free()
	
func shoot() -> void:
	pass

