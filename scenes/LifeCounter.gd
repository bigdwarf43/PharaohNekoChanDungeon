extends Node2D



func _ready():
	Globals.lives = 9
	
func _physics_process(delta):
	if Globals.lives == 8:
		$life9.hide()
	elif Globals.lives == 7:
		$life8.hide()
	elif Globals.lives == 6:
		$life7.hide()
	elif Globals.lives == 5:
		$life6.hide()
	elif Globals.lives == 4:
		$life5.hide()
	elif Globals.lives == 3:
		$life4.hide()
	elif Globals.lives == 2:
		$life3.hide()
	elif Globals.lives == 1:
		$life2.hide()
	elif Globals.lives == 0:
		$AudioStreamPlayer.play()
		get_tree().reload_current_scene()
