extends CanvasLayer

var pause = false

func _on_button_reprendre_pressed():
	pause_unpaused()
func pause_unpaused():
	pause = !pause
	
	if pause:
		get_tree().paused = true
		show()
	else:
		get_tree().paused = false
		hide()

func _input(event):
	
	if event.is_action_pressed("pause"):
		pause_unpaused()


func _on_button_menu_principal_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
