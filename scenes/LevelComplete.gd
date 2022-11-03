extends Area2D

export(String, FILE,"*.tscn") var next_world

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$TransitionScreen.transition()
		
func _on_TransitionScreen_transitioned():
	get_tree().change_scene(next_world)

func _on_LevelComplete_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer.play()
		
