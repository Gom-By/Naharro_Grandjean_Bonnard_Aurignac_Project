extends Node

# TODO: make it export
@onready var pre_bullet := preload("res://Scenes/Bullet/bullet.tscn")

var offset: float = 0.0

func _on_timer_timeout() -> void:
	var bullet: Node2D = pre_bullet.instantiate()
	offset = randf_range(-(get_parent().stats as Stats).angle, (get_parent().stats as Stats).angle)
	if(offset != 0) :
		$Timer.wait_time = 0.05
	else: 
		$Timer.wait_time = 0.3
	(bullet.get_node("MovementComponent") as LinearMovement).angle = randf_range(get_parent().rotation - offset, get_parent().rotation + offset)
	(bullet as Bullet).damage = (get_parent().stats as Stats).damage 
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = get_parent().global_position
