extends CanvasLayer

onready var timer = get_node("Timer")

var seconds = 5

func _ready():
	timer.set_wait_time(1.1)
	timer.start()

func _on_Timer_timeout():
	seconds -= 1
	get_node("ColorRect/Time").set_text(str(seconds))
	if seconds == -1:
		get_tree().reload_current_scene()
		$AnimationPlayer.play("fade_to_normal") 

func transition():
	$AnimationPlayer.play("fade_to_black")


		
