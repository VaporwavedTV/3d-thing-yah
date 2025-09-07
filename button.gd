extends Button

@onready var camera = $/root/World/AllThings/screen/CSGBox3D15/SubViewport/Camera3D
var going_right := true
var waiting := false

func _process(_delta):
	if button_pressed and not waiting:
		if going_right:
			camera.rotation.y += 0.01
			if camera.rotation.y >= deg_to_rad(75):
				_pause_and_flip(false)
		else:
			camera.rotation.y -= 0.01
			if camera.rotation.y <= deg_to_rad(5):
				_pause_and_flip(true)
		
		


func _pause_and_flip(next_dir: bool) -> void:
	waiting = true
	# Start a timer without spamming
	await get_tree().create_timer(0.5).timeout
	going_right = next_dir
	waiting = false
