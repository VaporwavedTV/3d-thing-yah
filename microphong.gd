extends CSGCombiner3D

@onready var player = get_node("/root/World").find_child("player", true)
@onready var Say = get_node("/root/World/Player_Talking_Box")
@onready var Say_yes = get_node("/root/World/Player_Talking_Box/Panel/YesButton")
@onready var Say_no = get_node("/root/World/Player_Talking_Box/Panel/NoButton")


func interact():
	
	Say.show_text("Hey... ")
	Say.delay_time = 2
	Say.delay_text()
	Say.show_text("I guess it's your first day huh.")
	
	Say_yes.text = "It is."
	
	Say_no.text = "..."
	
	
	player.nomoving()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	player.get_child(3).no_move()
	
	
