extends CharacterBody2D


var direction =Vector2.RIGHT
var velosity = Vector2.ZERO

@onready var animatedSprite = $AnimatedSprite2D
@onready var rka = $RayCast2D
@onready var rkb = $RayCast2D2

	
	
var motion = Vector2()
@export var speed: int = 60
@export var gravity: int = 10
var dir=1


	
func _process(delta):
	set_velocity(motion)
	set_up_direction(Vector2.UP)
	move_and_slide()
	motion = velocity
	pass
	
func _physics_process(delta):
	motion.x=speed*dir
	animatedSprite.play("enemy_c_w")
	
	if motion.x<0:
		animatedSprite.flip_h=false
	elif motion.x>0:
		animatedSprite.flip_h=true
		
	var edge = rka.is_colliding() and rkb.is_colliding()
	if is_on_wall() or edge==false :
		dir = dir * -1
		#animatedSprite.flip_h=true
		motion.x=speed*dir
	if is_on_floor()==false:
		motion.y += gravity
		
	
	pass
func Hirt_sound():
	
	SoundPlayer.play_sound(SoundPlayer.Hirt)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.Hirt_sound()
		body.global_position = body.respoint
		body.helth=body.helth-1
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	if area.is_in_group("Gun"):
		queue_free()
		Hirt_sound()
	pass # Replace with function body.
	

