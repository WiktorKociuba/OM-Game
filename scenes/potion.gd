extends Area2D

@export var points_value: int = 20

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":  # upewnij się, że gracz nazywa się "Player"
		var gs = get_node("/root/GameState")
		gs.add_points(points_value)
		queue_free()  # usuń potkę po zebraniu
