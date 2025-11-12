class_name DamageBoost
extends Boost

func stat_increased(p: Player, damage: float):  
	player = p
	base = p.stats.damage
	p.stats.damage *= damage
	buff_increase = p.stats.damage - base
	
func _on_timer_timeout():
	if (player):
		player.stats.damage -= buff_increase
	queue_free()
