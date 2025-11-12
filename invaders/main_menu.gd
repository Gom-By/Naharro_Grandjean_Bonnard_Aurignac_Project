extends Node2D


func _on_bouton_jouer_pressed() -> void:
	GameManager.score = 0
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_bouton_quitter_pressed() -> void:
	get_tree().quit() 
