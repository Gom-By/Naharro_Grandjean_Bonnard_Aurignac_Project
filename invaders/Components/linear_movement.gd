class_name LinearMovement
extends Node

@export var target_position: Vector2

var _direction: Vector2
var speed_mult: float = 1.0
var angle: float = 0.0

@onready var obj : Node2D = get_parent()

func _ready() -> void:
	_direction = target_position.normalized().rotated(angle)

func _physics_process(delta: float) -> void:

obj.position += _direction * speed_mult * delta * 100

func set_direction(direction: Vector2) -> void:
	_direction = direction
