extends CharacterBody2D


var motion = Vector2()
@export var speed: int = 60
@export var gravity: int = 1
var dir=1

@onready var animatedSprite = $AnimatedSprite2D

	
func _process(delta):
	set_velocity(motion)
	set_up_direction(Vector2.UP)
	move_and_slide()
	motion = velocity
	pass
	
func _physics_process(delta):
	motion.x=speed*dir
	animatedSprite.play("enemy_b_w")
	
	if motion.x<0:
		animatedSprite.flip_h=false
	elif motion.x>0:
		animatedSprite.flip_h=true
		
	if is_on_wall():
		dir = dir * -1
		#animatedSprite.flip_h=true
		motion.x=speed*dir
	if is_on_floor()==false:
		motion.y += gravity
		
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	
	if body.name=="player":
		body.Hirt_sound()
		
		queue_free()
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	if body.is_in_group("player"):
		body.Hirt_sound()
		#get_tree().reload_current_scene()
		body.global_position = body.respoint
		body.helth=body.helth-1
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
	if area.is_in_group("Gun"):
		queue_free()
	pass # Replace with function body.
