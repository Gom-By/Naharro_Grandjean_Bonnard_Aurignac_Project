class_name Bullet
extends Area2D

@export var group_target: String = "enemies"

var damage: float = 1.0

func _ready() -> void:
	$MovementComponent.speed_mult = 2.5

func _on_body_entered(body: Node) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			var health: HealthComponent = body.get_node("HealthComponent")
			health.take_damage(damage)
		queue_free()
