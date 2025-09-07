extends Node3D



var players: Array = []


@export var player_count := 5



var last_index := -1
var hit_sounds := [
preload("res://435697__samsterbirdies__metalbang2.mp3"),
preload("res://435696__samsterbirdies__metalbang3.mp3"),
#preload("res://Recording (6).mp3"),
#preload("res://Recording (8).mp3"),
#preload("res://Recording (9).mp3"),
#preload("res://Recording (10).mp3"),
#preload("res://Recording (11).mp3"),
#preload("res://Recording (12).mp3"),
#preload("res://Recording (13).mp3"),
#preload("res://Recording (14).mp3")
]


@onready var rigidbodies = get_tree().get_nodes_in_group("rigid_sounds")
var moving
var last_contact_count := 0



func _ready():
	
	for i in range(player_count):
		
		var p = AudioStreamPlayer3D.new()
		add_child(p)
		players.append(p)
		
	
	
	
	for rb in rigidbodies:
		
		moving = rb
		
	
	moving.contact_monitor = true
	moving.max_contacts_reported = 5
	

func _physics_process(_delta):
	
	var current_count = moving.get_contact_count()
	
	if current_count != last_contact_count:
		
		if current_count > last_contact_count + 1 or current_count > last_contact_count and last_contact_count == 0:
			
			## can be removed or added /// if not $AudioStreamPlayer3D.playing: 
			
			find_em()
			
			
			play_hit_sound()
			
			# possible stop after minute timer /// await get_tree().create_timer(0.5).timeout
			#//// $AudioStreamPlayer3D.playing = false
			
			
	
	last_contact_count = current_count
	

func find_em():
	
	$".".global_position = moving.global_position
	



func play_hit_sound():
	
	var sound = hit_sounds.pick_random()
	
	# Find a free player
	for p in players:
		
		if !p.playing:
			
			p.stream = sound
			p.play()
			return
			
	
	# If all busy, just reuse one (optional)
	players[0].stop()
	players[0].stream = sound
	players[0].play()
	
