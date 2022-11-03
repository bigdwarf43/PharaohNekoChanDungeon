extends Control

var dialog = ["This is it", "THE FABLED DAGGER OF PHARAOH NEKO CHAN.", "Fame,", "Power,", "all that i've ever wished for,", "ALL WILL BE MINE!", "BWAAAA! HAAAAAAA!"]

var dialog_index = 0
var finished = false

signal dialog_complete

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
		emit_signal("dialog_complete")
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
