extends Label

func _ready():
	pass

func _process(delta):
	self.text = "Parts found: " + str(PartScoreManager.score)
	if PartScoreManager.score == 5:
		get_tree().change_scene_to_file("res://walking_up_to_the_chickenfarm.tscn")
