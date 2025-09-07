extends Node3D

@onready var fade_anim = get_node("../../screen/CSGBox3D15/Control/AnimationPlayer")
@onready var player = get_node("/root/World").find_child("player", true)
var turnon = false

func interact():
	
	if not turnon:
		
		fade_anim.play("Fade in computer")
		$Sprite3D2.visible = true
		turnon = true
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		player.yesmoving()
		player.get_child(3).yes_move()
		fade_anim.play_backwards("Fade in computer")
		await get_tree().create_timer(0.18).timeout
		$Sprite3D2.visible = false
		turnon = false
	
	if turnon:
		
		player.get_child(3).no_move()
		
		player.nomoving()
		$Control.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		
	
	
	
	
	
