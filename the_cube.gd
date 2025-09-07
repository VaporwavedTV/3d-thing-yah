extends Node3D

var rotate = 0.05

func _process(_delta):
	
	rotate_y(rotate * rotate)
	rotate_x(rotate * rotate)
	rotate_z(rotate * rotate)
	
	
