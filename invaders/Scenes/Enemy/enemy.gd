class_name Enemy
extends CharacterBody2D

@export var speed: float = 1
@export var group_target: String = "player"
@export var stats: Stats

@onready var collision := $HitBox

func _ready() -> void:
	$HealthComponent.reset(stats.health)

func erase_self() -> void:
	GameManager.enemies.erase(self)
	queue_free()

func drop_item() -> void: 
	for i in stats.loot: 
		if(randf() < i.drop_chance):
			var drop: Node2D = i.scene.instantiate()
			get_tree().current_scene.call_deferred("add_child", drop)
			drop.global_position = global_position

func _on_health_component_death() -> void:
	drop_item()
	queue_free()
	GameManager.enemies.erase(self)

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			(body.get_node("HealthComponent") as HealthComponent).take_damage(stats.damage)
