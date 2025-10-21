class_name HealthComponent extends Node

signal death

@export var max_hit_points := 10
var current_health := 10

func _ready() -> void:
	current_health = max_hit_points

# inflict damage on an enemy reducing current_health
# emit death signal when current_health <= 0
# and free the parent object
# params:  amount -> the amount of damage to reduce from current_health
func take_damage(amount: int) -> void:
	current_health -= amount 
	if current_health <= 0:
		death.emit()
		get_parent().queue_free()
