extends Node2D

@export var speed: float = 100.0
@export var lifetime: float = 5.0
@export var target_position: Vector2

var _direction: Vector2
var _time_alive: float = 0.0

func _ready() -> void:
	_direction = Vector2.DOWN.normalized() # (target_position - global_position).normalized()

func _physics_process(delta: float) -> void:
	global_position += _direction * speed * delta

	_time_alive += delta
	if _time_alive >= lifetime:
		queue_free()
