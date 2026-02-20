extends Button

var pressed_button = false

func _on_pressed() -> void:
	pressed_button = true
	$"../..".answer_no()
	
	$AudioStreamPlayer2D.play(0.35)
	pressed_button = false
	
