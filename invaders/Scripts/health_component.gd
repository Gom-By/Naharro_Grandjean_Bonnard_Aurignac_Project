class_name HealthComponent extends Node

signal death

@export var max_hit_points := 10
var current_health := 10

func _ready() -> void:
	current_health = max_hit_points

func take_damage(amount: int) -> void:
	current_health -= amount 
	if current_health < 0:
		death.emit()
