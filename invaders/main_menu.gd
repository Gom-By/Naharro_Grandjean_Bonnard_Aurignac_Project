extends Node2D





func _on_bouton_jouer_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_bouton_quitter_pressed() -> void:
	get_tree().quit() 
