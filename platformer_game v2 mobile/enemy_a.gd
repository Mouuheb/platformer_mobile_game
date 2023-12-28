extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemy_a_body_entered(body):
	print(body)
	if body.is_in_group("player"):
		body.Hirt_sound()
		#get_tree().reload_current_scene()
		body.global_position = body.respoint
		body.helth=body.helth-1
		#body.queue_free() ya5tafi
	pass # Replace with function body.
