extends CharacterBody2D
class_name Player

#to change state
enum{MOVE,CLIME}

var motion = Vector2()
@export var sp_leader: int = -7
@export var speed: int = 120
@export var gravity: int = 10
@export var jump: int = -210
@export var max_jump: int = -430
@export var can_double_jump: bool = false

@export var helth : int = 3
@export var coins : int = 0
@export var lvl : int = 1


@onready var h_one = $interface1/interface/VBoxContainer2/NinePatchRect/one
@onready var h_two = $interface1/interface/VBoxContainer2/NinePatchRect/two
@onready var h_three = $interface1/interface/VBoxContainer2/NinePatchRect/three
@onready var lvl_count = $interface1/interface/VBoxContainer/lvl/lvl
@onready var coin_count = $interface1/interface/VBoxContainer/coins/Label

@onready var key = $interface1/interface/VBoxContainer/coins/key
@onready var coin = $interface1/interface/VBoxContainer/coins/coin

@onready var c_one = $interface1/interface/VBoxContainer/coins/coin_one
@onready var c_two = $interface1/interface/VBoxContainer/coins/coin_two
@onready var c_three = $interface1/interface/VBoxContainer/coins/coin_three
@onready var c_four = $interface1/interface/VBoxContainer/coins/coin_four
@onready var c_five = $interface1/interface/VBoxContainer/coins/coin_five
@onready var c_six = $interface1/interface/VBoxContainer/coins/coin_six
@onready var c_seven = $interface1/interface/VBoxContainer/coins/coin_seven
@onready var c_eight = $interface1/interface/VBoxContainer/coins/coin_eight
@onready var c_nine = $interface1/interface/VBoxContainer/coins/coin_nine

@onready var lvl_one = $interface1/interface/VBoxContainer/lvl/lvl_one
@onready var lvl_two = $interface1/interface/VBoxContainer/lvl/lvl_two
@onready var lvl_three = $interface1/interface/VBoxContainer/lvl/lvl_three
@onready var lvl_four = $interface1/interface/VBoxContainer/lvl/lvl_four
@onready var lvl_five = $interface1/interface/VBoxContainer/lvl/lvl_five
@onready var lvl_six = $interface1/interface/VBoxContainer/lvl/lvl_six
@onready var lvl_seven = $interface1/interface/VBoxContainer/lvl/lvl_seven
@onready var lvl_eight = $interface1/interface/VBoxContainer/lvl/lvl_eight
@onready var lvl_nine = $interface1/interface/VBoxContainer/lvl/lvl_nine
@onready var lvl_zero = $interface1/interface/VBoxContainer/lvl/lvl_zero
@onready var lvl_one_2 = $interface1/interface/VBoxContainer/lvl/lvl_one2

@onready var bomb_ig = $interface1/interface/VBoxContainer2/NinePatchRect/bomb
@onready var bomb_one = $interface1/interface/VBoxContainer2/NinePatchRect/bomb3
@onready var bomb_two = $interface1/interface/VBoxContainer2/NinePatchRect/bomb4
@onready var bomb_three = $interface1/interface/VBoxContainer2/NinePatchRect/bomb5
@onready var bomb_zero = $interface1/interface/VBoxContainer2/NinePatchRect/bomb2
var bomb_count = 3
var comp_coin = 9


var leadercheack = false
var state = MOVE
var respoint=Vector2(0,0)
func _ready():
	respoint=global_position
	pass

@onready var animatedSprite = $AnimatedSprite2D


func _process(_delta):
	helth_update()
	coin_update()
	lvls_update()
	bomb_update()
	Blaster()
	if global_position.y >=800:
		global_position = respoint
	if leadercheack :
		clime_state()
	else:
		move_state()
	pass
func move_state():
	set_velocity(motion)
	set_up_direction(Vector2.UP)
	move_and_slide()
	motion = velocity
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		animatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
			Run_sound()
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
		animatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
			Run_sound()
	else:
		motion.x=0
		$AnimatedSprite2D.play("Idel")
	if is_on_floor() == false:
		motion.y += gravity
	if Input.is_action_just_pressed("ui_up")==true:
		Jump_sound()
		if is_on_floor():
			can_double_jump = true
			motion.y = jump
		elif can_double_jump :
			can_double_jump = false
			motion.y = jump*1.25
	if Input.is_action_pressed("ui_down"):
		if is_on_floor()==false:
			motion.y=-jump
	pass
func clime_state():
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		animatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
		animatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		motion.x=0
		$AnimatedSprite2D.play("Idel")
	if Input.is_action_pressed("ui_up")==true:
			motion.y += sp_leader

	elif Input.is_action_pressed("ui_down"):
		if is_on_floor()==false:
			motion.y-=sp_leader
	else:
		motion.y=0
	set_velocity(motion)
	set_up_direction(Vector2.UP)
	move_and_slide()
	motion = velocity
	
	pass
	
func Void():
	if global_position.y >=30:
		get_tree().reload_current_scene()
	pass

func helth_update():
	if(helth==3):
		h_one.visible=true
		h_two.visible=true
		h_three.visible=true
	if(helth==2):
		h_one.visible=true
		h_two.visible=true
		h_three.visible=false
	if(helth==1):
		h_one.visible=true
		h_two.visible=false
		h_three.visible=false
	if(helth==0):
		Hirt_sound()
		get_tree().reload_current_scene()


func coin_update():
	
	#coin_count.text=str(coins)
	comp_coin=9-coins
	if comp_coin==1:
		c_one.visible=true
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==2:
		c_one.visible=false
		c_two.visible=true
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==3:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=true
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==4:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=true
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==5:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=true
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==6:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=true
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==7:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=true
		c_eight.visible=false
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==8:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=true
		c_nine.visible=false
		key.visible=false
		coin.visible=true
	if comp_coin==9:
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=true
		key.visible=false
		coin.visible=true
	if comp_coin==0:
		key.visible=true
		coin.visible=false
		c_one.visible=false
		c_two.visible=false
		c_three.visible=false
		c_four.visible=false
		c_five.visible=false
		c_six.visible=false
		c_seven.visible=false
		c_eight.visible=false
		c_nine.visible=false
func lvls_update():
	
	#lvl_count.text=str(lvl)
	if lvl==1:
		lvl_one.visible=true
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==2:
		lvl_one.visible=false
		lvl_two.visible=true
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==3:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=true
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==4:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=true
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==5:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=true
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==6:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=true
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==7:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=true
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==8:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=true
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==9:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=true
		lvl_zero.visible=false
		lvl_one_2.visible=false
	if lvl==10:
		lvl_one.visible=false
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=true
		lvl_one_2.visible=true
	if lvl==1:
		lvl_one.visible=true
		lvl_two.visible=false
		lvl_three.visible=false
		lvl_four.visible=false
		lvl_five.visible=false
		lvl_six.visible=false
		lvl_seven.visible=false
		lvl_eight.visible=false
		lvl_nine.visible=false
		lvl_zero.visible=false
		lvl_one_2.visible=true


	pass
func Hirt_sound():
	
	SoundPlayer.play_sound(SoundPlayer.Hirt)
	
func Jump_sound():
	SoundPlayer.play_sound(SoundPlayer.Jump)
	
func Run_sound():
	#SoundPlayer.play_sound(SoundPlayer.Run)
	pass

func Reword_sound():
	SoundPlayer.play_sound(SoundPlayer.Coin)

func Blaster():
	if Input.is_action_just_pressed("shoot"):
		if bomb_count>0:
			bomb_count-=1
			print("hi")
			var bullet = preload("res://gun/bomb.tscn").instantiate()
			bullet.global_position = $AnimatedSprite2D/Marker2D.global_position
			
			if(animatedSprite.flip_h):
				bullet.dir = 1
				pass
			else:
				bullet.dir = -1
				pass
			
			bullet.shooter=self
			get_parent().add_child(bullet)
		else:
			bomb_ig.visible=true
	pass

func bomb_update():
	
	#lvl_count.text=str(lvl)
	if bomb_count==3:
		bomb_zero.visible=false
		bomb_one.visible=false
		bomb_two.visible=false
		bomb_three.visible=true
	if bomb_count==2:
		bomb_zero.visible=false
		bomb_one.visible=false
		bomb_two.visible=true
		bomb_three.visible=false
	if bomb_count==1:
		bomb_zero.visible=false
		bomb_one.visible=true
		bomb_two.visible=false
		bomb_three.visible=false
	if bomb_count==0:
		bomb_zero.visible=true
		bomb_one.visible=false
		bomb_two.visible=false
		bomb_three.visible=false
