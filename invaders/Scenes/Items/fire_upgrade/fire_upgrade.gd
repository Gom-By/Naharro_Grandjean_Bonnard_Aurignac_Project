class_name FireUpgrade
extends Boost

func stat_increased(p: Player, angle: float):  
	player = p
	base = p.stats.angle
	p.stats.angle += clampf(angle, -40, 40)
	buff_increase = p.stats.angle - base
	print_debug("buff taken, new angle :", p.stats.angle)

func _on_timer_timeout():
	if (player):
		player.stats.angle = 0.0
	queue_free()
