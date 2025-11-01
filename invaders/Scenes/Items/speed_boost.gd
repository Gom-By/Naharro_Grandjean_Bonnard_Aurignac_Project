class_name SpeedBoost
extends Boost

func stat_increased(p: Player, potency: float):  
	base = p.stats.speed;
	p.stats.speed *= potency
	buff_increase = p.stats.speed - base
	
func _on_timer_timeout():
	if (get_tree().current_scene.get_node("Player")):
		(get_tree().current_scene.get_node("Player") as Player).speed -= buff_increase
