extends Control

var dialog = ["After escaping the dungeon pharaoh neko chan found himself amidst a civilization whose behaviours were unknown to him. Overwhelmed by his grief all he could do was to shed tears. But he found a companion, an old lady. She took him to her rusty old palace where he found people of his kind, lots of them. Even though they were ugly and uncultured they were his kind. Nowadays burning the world down is the least of his worries. He spends most of his time playing with yarn balls and searching for the box of treats that the old lady has hidden in her dungeon. Conquering the world can wait, i mean he has 9 lives...... and that's a lot of time"]

var dialog_index = 0
var finished = false

signal dialog_complete

func _ready():
	load_dialog()

func _process(delta):
	$dialogIndicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/MainMenu.tscn")


func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		emit_signal("dialog_complete")
		queue_free()
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
