class_name Drop
extends Resource

@export var name: String
@export var count: int
@export var max_count: int
@export var bufftype: BuffType
@export var potency: float
@export var drop_chance: float
@export var scene: PackedScene

enum BuffType {
	HEALTH_REGEN, 
	SPEED_BOOST, 
	ATTACK_BOOST
}
