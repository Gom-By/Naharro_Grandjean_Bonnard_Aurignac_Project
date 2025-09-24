extends Node

@onready var pre_enemy := preload("res://Prefab/Enemy.tscn")
var enemies : Array[Enemy] = []

func _ready() -> void:
	var timer := Timer.new()
	timer.wait_time = 1
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(spawn_enemy)

func _process(_delta: float) -> void:
	pass

func spawn_enemy() -> void:
	update_enemies()
	print_debug("enemies :", enemies)
	if(enemies.size() >= 5 ): return
	
	var enemy: Node2D = pre_enemy.instantiate()
	get_tree().current_scene.call_deferred("add_child", enemy)
	var pos_x := randf_range(0, get_window().size.x)
	enemy.global_position = Vector2(pos_x, 0);
	enemies.append(enemy)

func update_enemies() :
	enemies = enemies.filter(is_instance_valid)
