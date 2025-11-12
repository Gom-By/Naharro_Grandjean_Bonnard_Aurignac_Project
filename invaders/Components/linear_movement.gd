extends Node

signal despawn

@onready var obj : Node2D = get_parent()
@export var speed: float = 100.0
@export var lifetime: float = 5.0
@export var target_position: Vector2

var _direction: Vector2
var _time_alive: float = 0.0

func _ready() -> void:
	_direction = target_position.normalized() # (target_position - global_position).normalized()

func _physics_process(delta: float) -> void:
	obj.global_position += _direction * speed * delta

func set_direction(direction: Vector2) -> void:
	_direction = direction
