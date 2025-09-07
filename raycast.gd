extends RayCast3D

var pressthing = false
var amgrabbing = false
var collided_object = null
var throw_speed = 0
var move_rate = 10
var element_ui = false
var reticle = true
var dialog = false
var cangrab = true




func _physics_process(delta):
	
	
	
	var interactcast = $"../raycast2".get_collider()
	var point = $hold
	
	
	if interactcast != null and reticle:
		if interactcast.is_in_group("grab") or interactcast.is_in_group("Interactable"):
			$"../dot look/SpotLight3D".light_color = Color(1,0,0)
		else:
			$"../dot look/SpotLight3D".light_color = Color(1,1,1)
		
		if interactcast.is_in_group("grab") and element_ui:
			$"RMB to Grab".visible = true
		else:
			$"RMB to Grab".visible = false
		if interactcast.is_in_group("Interactable") and element_ui:
			$"E to Interact".visible = true
		else:
			$"E to Interact".visible = false
	else:
		$"../dot look/SpotLight3D".light_color = Color(1,1,1)
		$"RMB to Grab".visible = false
		$"E to Interact".visible = false
		
	
	if Input.is_action_just_pressed("grab") and cangrab:
		
		collided_object = get_collider()
		if collided_object != null and collided_object.is_in_group("grab"):
			amgrabbing = true
			
		
		
		
	
	if Input.is_action_pressed("LMB") and amgrabbing:
		$hold/ProgressBar.visible = true
		throw_speed = clamp(throw_speed, 0, 5)
		throw_speed += 0.1
		$hold/ProgressBar.value = throw_speed * 20
		
	
	if Input.is_action_pressed("grab") and cangrab:
		
		if Input.is_action_just_released("LMB"):
			
			var throw_direction = -global_transform.basis.y
			var throw_place = throw_direction * throw_speed
			
			if amgrabbing:
				
				
				collided_object.apply_central_impulse(throw_place)
				
				throw_speed = 0
				
				amgrabbing = false
				$hold/ProgressBar.visible = false
				
			
		
		
		
		
		if amgrabbing:
			
			move_rate = collided_object.global_position.distance_to(point.global_position) * 6
			
			
			
			
			
			
			if collided_object != null:
				if collided_object.is_in_group("grab"):
					
					
					
					
					
					collided_object.global_position = collided_object.global_position.move_toward(point.global_position, move_rate * delta)
					
					if collided_object.global_position.distance_to($"../..".global_position) < $"../..".global_position.distance_to(point.global_position) - 2:
						collided_object.global_position += -(($"../..".global_position - collided_object.global_position).normalized() * move_rate * delta)
						
					
					
					
					
					
					if collided_object.is_class("RigidBody3D"):
						collided_object.linear_velocity = Vector3.ZERO
		
	
	
	if Input.is_action_just_released("grab") and cangrab and amgrabbing == true:
		
		amgrabbing = false
		collided_object.apply_central_impulse(-(collided_object.global_position - point.global_position).normalized() * move_rate * 0.6)
		collided_object = null
		throw_speed = 0
		$hold/ProgressBar.visible = false
		
	
	
	if Input.is_action_just_pressed("E"):
		
		if not amgrabbing:
			collided_object = get_collider()
		
		if collided_object != null:
			
			if collided_object.is_in_group("Interactable"):
				pressthing = true
				
			elif not collided_object.is_in_group("Interactable"):
				pressthing = false
				
		
		if collided_object != null:
			if pressthing:
				
				if collided_object.has_method("interact"):
					
					collided_object.interact()
					
				
			
	
	
	if Input.is_action_just_pressed("LMB"):
		
		if not amgrabbing:
			collided_object = get_collider()
		
		if collided_object != null:
			
			if collided_object.is_in_group("3d dialogue box"):
				pressthing = true
				
			elif not collided_object.is_in_group("3d dialogue box"):
				pressthing = false
				
		
		if collided_object != null:
			if pressthing:
				
				if collided_object.has_method("interact"):
					
					dialog = true
					
				
				
				
				
	if collided_object != null:
		if Input.is_action_just_released("LMB"):
			if collided_object.has_method("stop"):
					
					collided_object.stop()
					
			
			
	
	if dialog:
		if Input.is_action_pressed("LMB"):
			collided_object.interact()
			
			if interactcast == null:
				collided_object.stop()
				cangrab = true
				dialog = false
				
			else:
				cangrab = false
			
		else:
			collided_object.stop()
			cangrab = true
			dialog = false
			
		

var nomouse = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("R") and amgrabbing:
			$"../..".no_move()
			var torque = Vector3((event.relative.y * 0.05), (event.relative.x * 0.05), 0)
			collided_object.apply_torque(torque)
			
			if nomouse:
				collided_object.apply_torque(-collided_object.angular_velocity)
				
			
		
	
	if event is not InputEventMouseMotion:
		nomouse = true
	else:
		nomouse = false
	
	if Input.is_action_just_released("R"):
			$"../..".yes_move()
			
