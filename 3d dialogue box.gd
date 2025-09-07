extends CSGBox3D

var held = 0
var answer_got = false

func _ready():
	
	clamp(held, 0, 100)
	

func interact():
	
	held += 2
	
	$"../SubViewport/Label/Panel/ProgressBar".visible = true
	$"../SubViewport/Label/Panel/ProgressBar".value = held
	
	if held == 100:
		held = 0
		$"..".visible = false
		use_collision = false
		answer_got = true
		
	

func stop():
	held = 0
	$"../SubViewport/Label/Panel/ProgressBar".visible = false
	$"../SubViewport/Label/Panel/ProgressBar".value = held
	

func _process(_delta):
	
	if $"..".visible == false:
		
		use_collision = false
		
	
	else:
		
		use_collision = true
		
	
	if answer_got == true:
		
		get_node("/root/World/AllThings/Node3D8/CSGCombiner3D").thisappear()
		
		answer_got = false
		
	
