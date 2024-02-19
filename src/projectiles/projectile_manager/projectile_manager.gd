extends Node2D
class_name ProjectileManager

func _on_character_1_new_projectile(proj):
	add_child(proj)
