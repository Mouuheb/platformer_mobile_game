extends Area2D

var speed = 3
var dir =1
var shooter = null
var x = 0
#var gravity = 10
var radius = 100  # Radius of the circular path
var angle = 0    # Current angle


func _physics_process(delta):
	
	
	position += Vector2(speed * dir,0)
	#position += Vector2(speed * dir,-sqrt(2-((int(position.x*position.x))%3))/100)
	#position.x=position.x+ 2  #Vector2(speed * dir,0.2)
	#position.y+=0.5
	#print(position.x)
	#angle += speed * delta
	#var x = 0
	#var y = radius * sin(angle)

	# Set the position of the bullet
	#position.x += x
	#position.y += y
	pass



func _on_area_2d_body_entered(body):

	if body == shooter:
		return
	queue_free()
	pass # Replace with function body.




