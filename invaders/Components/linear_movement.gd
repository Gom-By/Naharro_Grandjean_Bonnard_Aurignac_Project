extends Node

@export var target_position: Vector2

var _direction: Vector2
var speed_mult: float = 1.0

@onready var obj : Node2D = get_parent()

func _ready() -> void:
	_direction = target_position.normalized()

func _physics_process(delta: float) -> void:
	obj.global_position += _direction * speed_mult * delta * 100
