class_name HealthRegenPotion
extends Boost

func stat_increased(p: Player, potency: float):  
	(p.get_node("HealthComponent") as HealthComponent).heal(potency)
