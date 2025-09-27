extends RigidBody2D

const SPEED = 150.0
@export var hit = false
var hit_count = 0

func _ready() -> void:
	lock_rotation = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_node("/root/Node2D/Player")
	var playerPos = player.position
	if hit_count >= 3:
		GameState.add_points(200)
		queue_free()
	if player and not hit:
		var direction = (playerPos-position).normalized()
		
		linear_velocity = direction * SPEED
	elif hit:
		var direction = (position-playerPos).normalized()
		linear_velocity = direction * SPEED 
		await get_tree().create_timer(1.0).timeout
		hit = false
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Decrease health")
		body.health -= 1
		await get_tree().create_timer(3.0).timeout
