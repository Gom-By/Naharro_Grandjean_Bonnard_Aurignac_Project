extends Control


func _on_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("uid://dvtf5yrt2t3ak")


func _on_rejouer_pressed() -> void:
	GameManager.score = 0
	get_tree().change_scene_to_file("uid://dqmmq0spvvj83")
