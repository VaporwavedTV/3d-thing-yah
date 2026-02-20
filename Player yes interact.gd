extends Button

@onready var Lamp = get_node("/root/World").find_child("Lamp", true)
@onready var flashlight = get_node("/root/World").find_child("flashlightobject", true)
var pressed_button = false

func _on_pressed() -> void:
	
	pressed_button = true
	
	if Lamp.get_child(0).lamp_interacted == true:
		if Lamp.get_child(0).is_on == true:
			$"../..".answer_good = Lamp.get_child(0).turn_off()
		else:
			$"../..".answer_good = Lamp.get_child(0).turn_on()
		$"../..".answer_yes()
		
	
	if flashlight.flashlight_interacted == true:
		$"../..".answer_good = flashlight.pick_up()
		$"../..".answer_yes()
		
	
	
	
	Lamp.get_child(0).lamp_interacted = false
	flashlight.flashlight_interacted = false
	
	
	pressed_button = false
	
	
