extends Control


# Called when the node enters the scene tree for the first time.
@export var target_lvl = "res://lvl_1.tscn";


func _on_button_pressed():
	get_tree().change_scene_to_file(target_lvl)
	pass # Replace with function body.


func _on_button_3_pressed():
	get_tree().quit()
	pass # Replace with function body.
