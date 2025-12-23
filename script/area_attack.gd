extends Area2D



func _input(event):
	if event.is_action_pressed("attack"):
		attack()
		
	
func attack():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is RigidBody2D:
			var direction = (body.position - position).normalized()
			body.hit = true
			body.hit_count += 1
			print("hit")
