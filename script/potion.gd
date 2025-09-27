extends Area2D

@export var points_value: int = 100

func _ready():
	# Po wejściu w potkę wywoła się _on_body_entered
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# sprawdzamy, czy to gracz
	if body.name == "Player":  
		# dodajemy punkty do GameState (singleton)
		GameState.add_points(points_value)
		# usuwamy potkę z mapy
		queue_free()
