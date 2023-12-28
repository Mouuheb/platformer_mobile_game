extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("ch")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_cheak_body_entered(body):
	if body.is_in_group("player"):
		body.respoint=global_position
		$AnimatedSprite2D.play("not_ch")
	pass # Replace with function body.
