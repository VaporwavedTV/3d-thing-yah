extends Node3D

@onready var player = get_node("/root/World").find_child("player", true)
@onready var Say = get_node("/root/World/Player Interacting Box")
@onready var Say_yes = get_node("/root/World/Player Interacting Box/Panel/YesButton")
@onready var Say_no = get_node("/root/World/Player Interacting Box/Panel/NoButton")
var lamp_interacted = false
var is_on = true

func interact():
	lamp_interacted = true
	
	Say.show_text("It's just a totally normal, average lamp!")
	
	if is_on == true:
		Say_yes.text = "Turn off the Lamp"
	else:
		Say_yes.text = "Turn on the Lamp"
	Say_no.text = "Do nothing"
	
	player.nomoving()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	player.get_child(3).no_move()
	


func turn_on():
	$AudioStreamPlayer3D.play(0.2)
	$OmniLight3D.visible = true
	is_on = true
	


func turn_off():
	$AudioStreamPlayer3D.play(0.2)
	$OmniLight3D.visible = false
	is_on = false
	
