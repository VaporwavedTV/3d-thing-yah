extends Node3D

var has_flashlight = false
@onready var flashlight = get_node("/root/World").find_child("flashlightobject", true)

func _ready():
	
	if flashlight:
		flashlight.connect("got_flashlight", _got_flashlight_signal)
	




func _input(_event: InputEvent):
	if has_flashlight:
		if Input.is_action_just_pressed("F"):
			if visible:
				visible = not visible
			else:
				visible = true
	

func _got_flashlight_signal():
	has_flashlight = true
	
