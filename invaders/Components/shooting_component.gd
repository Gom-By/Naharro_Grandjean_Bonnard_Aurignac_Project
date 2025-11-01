extends Node

# TODO: make it export
@onready var pre_bullet := preload("res://Scenes/Bullet/bullet.tscn")

func _on_timer_timeout() -> void:
	var bullet: Node2D = pre_bullet.instantiate()
	(bullet as Bullet).damage = (get_parent().stats as Stats).damage 
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = get_parent().global_position
