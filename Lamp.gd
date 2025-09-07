extends Node3D


@onready var Think = get_node("/root/World/AllThings/Control")

func interact():
	
	Think.show_text("It's just a totally normal, average lamp!")
	
