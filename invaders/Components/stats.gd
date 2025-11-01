class_name Stats
extends Resource

@export var name: String
@export var health: int
@export var damage: float
@export var speed: float
@export var loot: Array[Drop]

#func _init(name: String, health: int, damage: int, speed: float, loot: Array[Drop]) -> void:
	#Stats.new(name, health, damage, speed, loot)
#
#static func _init_damage(damage: int):
	#return Stats.new("", 0, damage, 0.0, [])
