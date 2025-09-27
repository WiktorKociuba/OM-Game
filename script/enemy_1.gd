extends RigidBody2D

const SPEED = 150.0

func _ready() -> void:
	lock_rotation = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_node("/root/Node2D/Player")
	var playerPos = player.position
	if player:
		var direction = (playerPos-position).normalized()
		
		linear_velocity = direction * SPEED

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Decrease health")
