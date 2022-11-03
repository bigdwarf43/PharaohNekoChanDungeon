extends Button


func _on_quit_button_up():
	get_tree().quit()


func _on_quit_mouse_entered():
	get_parent().get_node("optionaudio").play()
