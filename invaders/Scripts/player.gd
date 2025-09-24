extends CharacterBody2D

@export var speed: float = 1

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if(get_global_mouse_position().distance_to(global_position) < 20):
		return 
	var direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	velocity = direction * speed * 400.0
	move_and_slide()	
