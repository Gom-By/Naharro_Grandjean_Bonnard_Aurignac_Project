class_name HealthComponent extends Node

signal death

var max_hit_points : float = 0
var current_health : float = 0

func reset(max_hit: int): 
	max_hit_points = max_hit
	current_health = max_hit

# inflict damage on an enemy reducing current_health
# emit death signal when current_health <= 0
# params:  amount -> the amount of damage to reduce from current_health
func take_damage(amount: float) -> void:
	current_health -= amount 
	if current_health <= 0:
		death.emit()

func heal(amount: int) -> void: 
	print_debug(self, " got healed")
	current_health += amount
