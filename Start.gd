extends Button


func _on_Start_button_up():
	get_tree().change_scene("res://scenes/Scene1.tscn")


func _on_Start_mouse_entered():
	get_parent().get_node("optionaudio").play()
