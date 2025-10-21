extends Area2D

@export var group_target: String = "enemies"
@export var damage := 1

func _ready() -> void:
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			var health: HealthComponent = body.get_node("HealthComponent")
			health.take_damage(damage)
			print_debug("Bullet hit : " + group_target)
		queue_free()
