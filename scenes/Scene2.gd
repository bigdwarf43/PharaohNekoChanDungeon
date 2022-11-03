extends Node2D



func _on_Scene2_dialog_scene2_dialog_completed():
	$TransitionScreen.transition()




func _on_TransitionScreen_transitioned():
	get_tree().change_scene("res://scenes/Level1.tscn")
