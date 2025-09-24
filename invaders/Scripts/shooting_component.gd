extends Node

@onready var pre_bullet := preload("res://Prefab/bullet.tscn")

func _ready() -> void:
	var timer := Timer.new()
	timer.wait_time = 0.25
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	var bullet: Node2D = pre_bullet.instantiate()
	# Add to root so bullet does not move with parent
	get_tree().current_scene.call_deferred("add_child", bullet)
	bullet.global_position = get_parent().global_position
