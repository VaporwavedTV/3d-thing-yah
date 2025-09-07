extends CSGCylinder3D

var car = 0


@onready var scene = load("res://object_box.tscn")

func _physics_process(float):
	
	
	var target_node = get_node("/root/world/Button thing")
	
	
	
	if visible:
		if Input.is_action_just_pressed("E"):
			
			var scene_to_spawn = scene.instantiate()
			add_child(scene_to_spawn)
			scene
			target_node.position = target_node.position
			
			
			
			car += 1
			
			print(car)
			
			
			
