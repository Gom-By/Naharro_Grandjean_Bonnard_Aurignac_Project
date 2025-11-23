extends ParallaxBackground

@export var scroll_speed: float = 80

func _process(delta: float) -> void:
	# Move the background texture downward
	scroll_offset.y += scroll_speed * delta
