extends Node

@onready var audioPlayers = $AudioPlayers
#const Jump = preload("res://sound/sound.wav")
const Jump = preload("res://sound2/jump.wav")
#const Run = preload("res://sound/footstep_concrete_000.ogg")
const Run = preload("res://sound2/run.wav")
const Hirt = preload("res://sound/laserSmall_004.ogg")
const Coin = preload("res://sound/coin_2.wav")


func play_sound(sound):
	for audioStreamPlayer in audioPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
