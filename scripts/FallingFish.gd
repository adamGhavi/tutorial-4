extends RigidBody2D

export var sceneName = "LoseScreen"

var fade = false

func _on_FallingFish_body_entered(body):
	if !fade:
		if body.get_name() == "Player":
			get_tree().change_scene(str("res://scenes/LoseScreen.tscn"))
			
		else:
			blink()
			despawn()
			fade = true
		
func blink():
	$Sprite.visible = !$Sprite.visible
	yield(get_tree().create_timer(.1), "timeout")
	blink()

func despawn():
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
