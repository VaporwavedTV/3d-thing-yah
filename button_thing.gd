extends CSGCylinder3D

@onready var scene = load("res://object_box.tscn")
var index = 1

func interact():
	
	
	var scene_to_spawn = scene.instantiate()
	add_child(scene_to_spawn)
	get_child(index).global_position = self.global_position
	index += 1
	
