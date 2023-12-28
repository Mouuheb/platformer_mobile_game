extends Area2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if body.is_in_group("player"):
		body. leadercheack = true
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group("player"):
		body. leadercheack = false
	pass # Replace with function body.
