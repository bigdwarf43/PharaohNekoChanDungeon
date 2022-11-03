extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.has_method("hit_spike"):
		body.hit_spike()
