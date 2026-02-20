extends CSGBox3D

@onready var player = get_node("/root/World").find_child("player", true)
@onready var Think = get_node("/root/World/Player Thinking Box")

var underwater = false

var water_text = [
	"I don't want to get wet right now.",
	"It's not like I can just swim back home.",
	"I'm not going into the water.",
	"It's dangerous out there.",
	"I'd probably just drown anyway.",
	"It's not worth it."
]

var water_text_2 = [
	"I don't know how to swim!",
	"~Over dramatic gurgling noises~",
	"STOP!"
]

var current_index_1 = 0
var current_index_2 = 0


func _process(_delta):
	
	if global_position.y > player.global_position.y + 2 and Think.animating == false:
		
		underwater = true
		
		if current_index_2 < water_text_2.size():  # Check if there's more text to display
			
			Think.show_text(water_text_2[current_index_2])
			
			current_index_2 += 1  # Move to the next text in the list
			if current_index_2 > 2:
				current_index_2 = 0
				
			
	else:
		underwater = false
		
	
	if global_position.y > player.global_position.y - 1.25 and Think.animating == false and underwater == false:
		
		if current_index_1 < water_text.size():  # Check if there's more text to display
			
			Think.show_text(water_text[current_index_1])
			
			current_index_1 += 1  # Move to the next text in the list
			if current_index_1 > 5:
				current_index_1 = 0
				
			
		
	
