extends KinematicBody2D


const ACCELERATION = 200

var move_speed = 60
var gravity = 400.0

var move_dir = 0
var velocity = Vector2()

var dialog_finished = false
func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if dialog_finished:
		if Input.is_action_pressed("move_left"):
			velocity.x = max(velocity.x-ACCELERATION, -move_speed)
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("run")
		elif Input.is_action_pressed("move_right"):
			velocity.x = min(velocity.x+ACCELERATION, move_speed)
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("run")
		else:     
			velocity.x = 0
			$AnimatedSprite.play("idle")
		
		move_and_slide(velocity, Vector2(0, -1))


func _on_Scene1_dialog_dialog_complete():
	dialog_finished = true
