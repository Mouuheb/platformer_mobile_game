extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.speed=body.speed/3
		body.jump=body.jump/1.75
		body.gravity=body.gravity/3
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group("player"):
		body.speed=body.speed*3
		body.jump=body.jump*1.75
		body.gravity=body.gravity*3
	pass # Replace with function body.
