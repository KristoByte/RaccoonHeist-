extends Label

func _ready():
	# Connect to the score_updated signal
	ScoreManager.connect("score_updated", self, "_on_score_updated")
	# Initialize the score display
	text = "Score: " + str(PartScoreManager.score)

func _on_score_updated(new_score: int):
	text = "Score: " + str(new_score)
