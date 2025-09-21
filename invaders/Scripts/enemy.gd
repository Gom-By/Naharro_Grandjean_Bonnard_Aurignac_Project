class_name Enemy extends CharacterBody2D

func _ready() -> void:
	$CollisionShape2D.connect("area_entered", _on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("p_bullets"):
		$HealthComponent.take_damage(1)
