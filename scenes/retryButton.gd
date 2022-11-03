extends Button

func _on_retryButton_button_up():
	get_tree().reload_current_scene()
