extends Node

var points: int = 0
var level: int = 1

func points_to_next_level() -> int:
	# Punkty potrzebne do następnego levelu (możesz zmienić formułę)
	return 100 + (level - 1) * 50

func add_points(amount: int):
	points += amount
	while points >= points_to_next_level():
		points -= points_to_next_level()
		level += 1
