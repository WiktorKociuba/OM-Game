extends CharacterBody2D


const SPEED = 300.0

func _input(event):
	if event.is_action_pressed("attack"):
		$AnimatedSprite2D.play("attack")
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("left", "right")
	if direction_x:
		velocity.x = direction_x * SPEED
		if direction_x > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y := Input.get_axis("up","down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction_x == 0 and direction_y == 0:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")

	move_and_slide()

		
