extends Node

@onready var pre_enemy := preload("res://Scenes/Enemy/Enemy.tscn")

var enemies: Array[Enemy]
var max_enemies := 5
var score = 0

# update enemies field 
# if number of enemies doesn't reach max_enemies 
# spawn an enemy at the top of the screen
func spawn_enemy() -> void:
	enemies.filter(is_instance_valid)
	if(enemies.size() >= max_enemies ): return
	
	var enemy: Node2D = pre_enemy.instantiate()
	get_tree().current_scene.call_deferred("add_child", enemy)
	
	var spawn_path: PathFollow2D = get_tree().current_scene.get_node("SpawnPath/PathFollow2D")
	spawn_path.progress_ratio = randf()
	var pos_x: float = spawn_path.position.x
	
	enemy.global_position = Vector2(pos_x, 0);
	enemies.append(enemy)

func reset_enemies(node: Enemy):
	enemies.erase(node)
