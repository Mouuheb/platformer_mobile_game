extends Area2D

#@export(String, FILE, "*.tscn") var target_lelel_path =""
@export var target_lvl_path = "";
#var lvls = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dor_body_entered(body):
	if body.is_in_group("player"):
		if body.coins>8:
			#lvls=lvls+1
			body.lvl=target_lvl_path
			print(target_lvl_path)
			get_tree().change_scene_to_file(target_lvl_path)
		
	pass # Replace with function body.





