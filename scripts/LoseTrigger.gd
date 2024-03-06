extends Area2D

func _on_Lose_Trigger_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://scenes/LoseScreen.tscn")
