extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("not_use_j")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_jump_body_entered(body):
	if body.is_in_group("player"):
		body.Jump_sound()
		body.motion.y = body.jump*2.2
		$AnimatedSprite2D.play("use_j")
	pass # Replace with function body.
