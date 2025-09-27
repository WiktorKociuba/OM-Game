extends CharacterBody2D


const SPEED = 300.0
@export var health = 5
@export var hearthSprite: Texture2D
var maxHealth = 5
var healthRestore = 0

func _input(event):
	if event.is_action_pressed("attack"):
		$AnimatedSprite2D.play("attack")

func _process(delta: float) -> void:
	if health < 5:
		if Time.get_ticks_msec() - healthRestore >= 30000:
			healthRestore = Time.get_ticks_msec()
			health += 1
	if health <= 0:
		pass
	for i in range(maxHealth):
		var heartNode = $Camera2D/HealthBar.get_child(i)
		if i < health:
			heartNode.visible = true
		else:
			heartNode.visible = false

func _physics_process(delta: float) -> void:
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

		
