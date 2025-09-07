extends CheckButton


@onready var aud_player = get_node("/root/World").find_child("AudioStreamPlayer3D", true)
@onready var anim_player = get_node("/root/World").find_child("LiftingWalk Player", true)


func _on_pressed() -> void:
	
	
	
	if button_pressed:
		
		disabled = true
		aud_player.play()
		anim_player.play("liftingwalk")
		await get_tree().create_timer(6.0).timeout
		disabled = false
		
	
	else:
		
		disabled = true
		aud_player.play()
		anim_player.play_backwards("liftingwalk")
		await get_tree().create_timer(6.0).timeout
		disabled = false
		
	
	
	
