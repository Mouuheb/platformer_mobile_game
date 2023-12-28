extends Node2D

@onready var animatedSprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
func _physics_process(delta):
	animatedSprite.play("default")



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		#get_tree().reload_current_scene()
		#body.global_position = body.respoint
		#body.helth=body.helth-1
		body.coins=body.coins+1
		body.Reword_sound()
		queue_free()
	pass # Replace with function body.
