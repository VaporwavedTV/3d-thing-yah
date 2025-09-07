extends Control



func resume():
	hide()
	get_tree().paused = false
	

func pause():
	
	get_tree().paused = true

func escape_menu():
	
	
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		
		pause()
		
		show()
		
		
	
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		resume()
		
		hide()
		
	

func _on_resume_pressed() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	resume()
	

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
	

func _on_quit_pressed() -> void:
	get_tree().quit()
	

func _process(_delta):
	escape_menu()
	
