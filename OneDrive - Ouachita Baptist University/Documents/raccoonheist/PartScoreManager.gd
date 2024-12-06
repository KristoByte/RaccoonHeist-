extends Node

var score: int = 0

func add_points(points: int):
	score += points
	emit_signal("score_updated", score)

signal score_updated(new_score: int)
