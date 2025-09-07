extends Node3D

@onready var world_env: WorldEnvironment = get_node("/root/World/WorldEnvironment")
@onready var sun_light = $DirectionalLight3D
@onready var moon_light = $DirectionalLight3D2

func _process(_delta):
	var energy = world_env.environment.background_energy_multiplier
	var turn = 0.05
	
	rotate_x(turn * turn)
	
	var rot_deg = rad_to_deg(rotation.x)
	if rot_deg < 0:
		energy -= turn * 0.2
		moon_light.light_energy += turn * 0.05
		sun_light.light_energy -= turn * 1
		
	else:
		energy += turn * 0.2
		moon_light.light_energy -= turn * 0.05
		sun_light.light_energy += turn * 1
		
	
	moon_light.light_energy = clamp(moon_light.light_energy, 0, 0.08)
	sun_light.light_energy = clamp(sun_light.light_energy, 0, 1.0)
	energy = clamp(energy, 0.05, 1)
	world_env.environment.background_energy_multiplier = energy
	
	
