extends Area2D

var is_dead_body_in = false

func _ready():
	var temp = get_parent().get_node("LevelComplete")
	temp.set_monitoring(false)
	temp.visible = false
	$Sprite.play("idle")
	
func _on_Switch_body_entered(body):
	if body.name == "DeadBody":
		is_dead_body_in = true
	var temp = get_parent().get_node("LevelComplete")
	temp.set_monitoring(true)
	temp.visible = true
	$Sprite.play("activated")
	$Player_entered.play()
	

func _on_Switch_body_exited(body):
	if body.name == "Player" && !is_dead_body_in:
		var temp = get_parent().get_node("LevelComplete")
		temp.set_monitoring(false)
		temp.visible = false
		$Sprite.play("idle")
		$Player_exited.play()
