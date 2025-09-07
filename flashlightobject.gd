extends RigidBody3D


signal got_flashlight


func interact():
	
	visible = false
	$CollisionShape3D.disabled = true
	$CollisionShape3D2.disabled = true
	
	emit_signal("got_flashlight")
	
	
	 
	
