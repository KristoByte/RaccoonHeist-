extends Control




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game Scenes/OpeningSceneRaccoonTalkingToPlayer.tscn")


#how to play screen will go here
func _on_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().quit()
