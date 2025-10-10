class_name Enemy extends CharacterBody2D

@export var speed: float = 1
@export var group_target: String = "player"
@onready var collision := $HitBox

func _ready() -> void:
	collision.connect("body_entered", _on_body_entered)
	$HealthComponent.connect("death", erase_self)
	
func _on_body_entered(body: Node) -> void:
	if body.is_in_group(group_target):
		if body.has_node("HealthComponent"):
			var health: HealthComponent = body.get_node("HealthComponent")
			health.take_damage(1)
			print(health.current_health)
		print("Player collision " + group_target)

func erase_self():
	GameManager.enemies.erase(self)
