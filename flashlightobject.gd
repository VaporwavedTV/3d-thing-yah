extends RigidBody3D


@onready var player = get_node("/root/World").find_child("player", true)
@onready var Say = get_node("/root/World/Player Interacting Box")
@onready var Say_yes = get_node("/root/World/Player Interacting Box/Panel/YesButton")
@onready var Say_no = get_node("/root/World/Player Interacting Box/Panel/NoButton")
signal got_flashlight
var flashlight_interacted = false


func pick_up():
	
	visible = false
	$CollisionShape3D.disabled = true
	$CollisionShape3D2.disabled = true
	
	emit_signal("got_flashlight")
	

func interact():
	flashlight_interacted = true
	
	
	Say.show_text("It's a flashlight!")
	
	Say_yes.text = "Pick up the flashlight"
	
	Say_no.text = "Do nothing"
	
	player.nomoving()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	player.get_child(3).no_move()
	
	
	if Say_yes.pressed_button or Say_no.pressed_button:
		flashlight_interacted = false
		
	
