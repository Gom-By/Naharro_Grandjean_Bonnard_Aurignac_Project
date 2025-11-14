class_name FireUpgrade
extends Boost

func stat_increased(p: Player, angle: float):  
	player = p
	base = p.stats.angle
	print_debug(angle)
	p.stats.angle += clampf(angle, -20, 20)
	buff_increase = p.stats.angle - base

func _on_timer_timeout():
	if (player):
		player.stats.angle = 0.0
	queue_free()
