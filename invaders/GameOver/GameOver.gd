extends Control


func _on_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_rejouer_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
