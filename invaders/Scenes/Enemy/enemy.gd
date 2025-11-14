class_name Enemy
extends CharacterBody2D

@export var speed: float = 1
@export var group_target: String = "player"
@export var stats: Stats

@onready var collision := $HitBox

@export var movement_pattern: MOVEMENT_PATTERN

@export_category("Horizontal Movement Pattern")
@export var left_bound: int
@export var right_bound: int
@export var straight_distance: int
var straight_begin: Vector2
var is_straight: bool
var last_direction: Vector2

enum MOVEMENT_PATTERN {
	STRAIGHT,
	HORIZONTAL,
}

func _ready() -> void:
	$HealthComponent.reset(stats.health)
	set_random_movement_pattern()
	init_movement_pattern()
	collision.connect("body_entered", _on_body_entered)

func _physics_process(_delta: float) -> void:
	process_movement_pattern()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			var health: HealthComponent = body.get_node("HealthComponent")
			health.take_damage(1)
			if health.current_health <= 0:
				get_tree().call_deferred("change_scene_to_file", "res://GameOver/GameOver.tscn") 
			print(health.current_health)
		print("Player collision " + group_target)

func set_random_movement_pattern() -> void:
	var available_patterns = [
		MOVEMENT_PATTERN.STRAIGHT,
		MOVEMENT_PATTERN.HORIZONTAL,
	]
	
	movement_pattern = available_patterns.pick_random()

func init_movement_pattern() -> void:
	match movement_pattern:
		MOVEMENT_PATTERN.STRAIGHT:
			%MovementComponent.set_direction(Vector2.DOWN)
		MOVEMENT_PATTERN.HORIZONTAL:
			%MovementComponent.set_direction(Vector2.RIGHT)
			last_direction = Vector2.RIGHT
			%MovementComponent.speed_mult *= 2

func process_movement_pattern() -> void:
	match movement_pattern:
		MOVEMENT_PATTERN.HORIZONTAL:
			if not is_straight and (
				%MovementComponent._direction == Vector2.LEFT and global_position.x <= left_bound
			) or (
				%MovementComponent._direction == Vector2.RIGHT and global_position.x >= right_bound
			):
				%MovementComponent.set_direction(Vector2.DOWN)
				straight_begin = global_position
				is_straight = true
			elif is_straight and straight_begin.distance_to(global_position) >= straight_distance:
				%MovementComponent.set_direction(-last_direction)
				last_direction = -last_direction
				is_straight = false

func erase_self():
	GameManager.enemies.erase(self)
	queue_free()

func drop_item() -> void: 
	for i in stats.loot: 
		if(randf() < i.drop_chance):
			var drop: Node2D = i.scene.instantiate()
			get_tree().current_scene.call_deferred("add_child", drop)
			drop.global_position = global_position
			break

func _on_health_component_death() -> void:
	GameManager.score += 1
	drop_item()
	queue_free()
	GameManager.enemies.erase(self)

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			(body.get_node("HealthComponent") as HealthComponent).take_damage(stats.damage)
