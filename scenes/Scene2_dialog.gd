extends Control

var dialog = ["Nyaaa....Foolish mortal", "Walked right into my trap", "His mortal vessel is mostly futile for a soul like mine.","But it will do for now","let me check, do i have everything?","My trusty little magical dagger", "check!", "My handsome face", "check!","NOW LETS CONQUER THIS ROTTEN WORLD!","But, first lets find our way out of this filthy dungeon.", "NYAAAAAAAAAA!!!!!"]

var dialog_index = 0
var finished = false

signal scene2_dialog_completed 

func _ready():
	load_dialog()

func _process(delta):
	$dialogIndicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, .5, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		emit_signal("scene2_dialog_completed")
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
