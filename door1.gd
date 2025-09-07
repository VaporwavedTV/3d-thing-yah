extends Node3D

var done = true

func interact():
	
	if done:
		get_node("../AnimationPlayer").play("door1")
		done = false
		
	
	else:
		get_node("../AnimationPlayer").play_backwards("door1")
		done = true
		
	
	
