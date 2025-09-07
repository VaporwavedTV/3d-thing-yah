extends Button


func _on_pressed() -> void:
	
	if $"../Files Window".open == false:
		$"../Files Window".open_window()
		
	else:
		$"../Files Window".close_window()
		
	
