extends KinematicBody2D

var gravity =5000

var y_velo = 0

func _ready():
	$AnimationPlayer.play("spawn")

func _physics_process(delta):
	y_velo = gravity * delta
	move_and_slide(Vector2(0,y_velo), Vector2(0,-1))
