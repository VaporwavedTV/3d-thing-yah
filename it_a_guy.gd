extends Node3D


func set_mass_recursive(node, mass):
	for child in node.get_children():
		if child is RigidBody3D:
			child.mass = mass
			child.sleeping = false
		set_mass_recursive(child, mass)

func _ready():
	set_mass_recursive($Skeleton3D, 0.1)
	
