extends Button

var pressed_button = false

func _on_pressed() -> void:
	pressed_button = true
	$"../..".answer_no()
	
	
	pressed_button = false
	
