extends Button

@onready var Lamp = get_node("/root/World").find_child("Lamp", true)
@onready var flashlight = get_node("/root/World").find_child("flashlightobject", true)
var pressed_button = false

func _on_pressed() -> void:
	
	pressed_button = true
	
	
	$"../..".answer_yes()
	
	
	$AudioStreamPlayer2D.play(0.35)
	pressed_button = false
	
	
