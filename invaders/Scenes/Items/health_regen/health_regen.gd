class_name HealthRegen
extends Boost

func stat_increased(p: Player, potency: float):  
	print_debug("heal regen active")
	(p.get_node("HealthComponent") as HealthComponent).heal(potency)

func _on_timer_timeout():
	queue_free()
