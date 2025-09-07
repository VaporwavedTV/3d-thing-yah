extends Button


func _on_pressed() -> void:
	
	if $"../CameraView Window".open == false:
		$"../CameraView Window".open_window()
		$"../AnimationPlayer".play_backwards("Close Application")
		
	else:
		$"../AnimationPlayer".play("Close Application")
		await get_tree().create_timer(0.18).timeout
		$"../CameraView Window".close_window()
		
	
