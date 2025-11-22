extends Node

func _ready() -> void:
	for i in get_children() :
		if(i is Area2D) : 
			i.connect("body_entered", on_body_entered)

# enemies disappear when hitting those hidden walls
func on_body_entered(body: Node2D):
	if(body.is_in_group("enemies")) :
		(body as Enemy).erase_self()
