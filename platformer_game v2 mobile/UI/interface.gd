extends CanvasLayer

var pause = 1
@onready var cont = $VBoxContainer2/NinePatchRect/Area2D/contune
@onready var pz = $VBoxContainer2/NinePatchRect/Area2D/pause
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		pause*=-1
	if pause>0:
		cont.visible=false
		pz.visible=true
	else:
		cont.visible=true
		pz.visible=false
		
	pass

func _on_area_2d_mouse_entered():
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		pause*=-1
	if pause>0:
		cont.visible=false
		pz.visible=true
	else:
		cont.visible=true
		pz.visible=false
		
	pass
	pass # Replace with function body.
	pass # Replace with function body.
