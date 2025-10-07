class_name Enemy extends CharacterBody2D

@onready var health = $HealthComponent

func _ready() -> void:
	health.connect("death", truc)
	pass

func _process(_delta: float) -> void:
	pass

func truc() -> void: 
	GameManager.enemies.erase(self)
