extends Node2D

func _on_Bottom_body_entered(body):
	if body.has_method("reset_ball"):
		body.reset_ball()
