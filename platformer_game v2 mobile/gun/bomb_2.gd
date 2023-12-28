extends CharacterBody2D


var speed = 1
var dir =1
var shooter = null
var motion = Vector2()
@export var gravity: int = 100

func _physics_process(delta):
	
	position += Vector2(speed * dir,0.35)
	if is_on_floor() == false:
		motion.y += gravity
	pass


func _on_body_entered(body):
	#if body.is_in_group("enemy"):
	if body.name!="player":
		body.queue_free()
		
	if body == shooter:
		return
	queue_free()
	pass # Replace with function body.
