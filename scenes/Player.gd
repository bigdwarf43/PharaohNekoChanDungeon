extends KinematicBody2D

const ACCELERATION = 200

var move_speed = 60
var gravity = 400.0
var max_jump_speed
var min_jump_speed
var max_jump_height = 1.5 * Globals.UNIT_SIZE
var min_jump_height = 0.5 * Globals.UNIT_SIZE
var jump_duration = 0.5 
var can_jump = true
var jump_was_pressed = false

var move_dir = 0
var velocity = Vector2()
var original_pos = Vector2()


func _ready():
	original_pos = position
	gravity = 2 * max_jump_height/ pow(jump_duration, 2)
	max_jump_speed = -sqrt(2 * gravity * max_jump_height)
	min_jump_speed = -sqrt(2 * gravity * min_jump_height)

func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if Input.is_action_pressed("move_left"):
		velocity.x = max(velocity.x-ACCELERATION, -move_speed)
		$Sprite.flip_h = true
		if is_on_floor():
			$AnimationPlayer.play("run")
	elif Input.is_action_pressed("move_right"):
		velocity.x = min(velocity.x+ACCELERATION, move_speed)
		$Sprite.flip_h = false
		if is_on_floor():
			$AnimationPlayer.play("run")
	else:     
		velocity.x = 0
		if is_on_floor():
			$AnimationPlayer.play("idle")
	
	if Input.is_action_just_pressed("die"):
		var temp_pos = position
		suicide(temp_pos)
		reset_pos()
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor() && Input.is_action_just_pressed("jump"):
			velocity.y = max_jump_speed
			$AudioStreamPlayer.play()
	
	if !is_on_floor():
		if velocity.y < 0:
			$AnimationPlayer.play("jump")
			
	if Input.is_action_just_released("jump") && velocity.y < min_jump_speed:
		velocity.y = min_jump_speed
	
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene("res://scenes/MainMenu.tscn")
	
func suicide(temp_pos):
	var DeadBody = preload("res://scenes/DeadBody.tscn").instance()
	get_parent().add_child(DeadBody)
	DeadBody.position = temp_pos
	$deadBodySpwan.play()
	Globals.lives = Globals.lives - 1

func hit_spike():
	$hurt.play()
	$TransitionScreen.transition()
	
func reset_pos():
	position = original_pos
	$AnimationPlayer.play("spawn")

func _on_TransitionScreen_transitioned():
	get_tree().reload_current_scene()
	
