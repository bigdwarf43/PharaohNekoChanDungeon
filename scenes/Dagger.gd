extends Node2D


func _on_Area2D_body_entered(body):
	$TransitionScreen.transition()
	


func _on_TransitionScreen_transitioned():
	get_tree().change_scene("res://scenes/Scene2.tscn")
