extends Node3D

var sens = 0.005
var mouse_move = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and mouse_move:
		get_parent().rotate_y(-event.relative.x * sens)
		
		
		
	

func no_move():
	mouse_move = false
	

func yes_move():
	mouse_move = true
	
