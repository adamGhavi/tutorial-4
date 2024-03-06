extends RigidBody2D

export var next_level = "Level2"
var shake = 5

var launch = false

var velocity: Vector2 = Vector2()
const UP = Vector2(0, -1)

func _process(delta):
	if launch:
		velocity.y -= 1
		position += velocity * delta
		
		$Sprite.offset = Vector2(rand_range(-shake, shake), rand_range(-shake, shake))

func _on_Familiar_Rocket_body_entered(body):
	if !launch:
		if body.get_name() == "Player":
			$RocketL.emitting = true
			$RocketR.emitting = true
			
			$Camera2D.current = true
			
			get_tree().get_root().get_node("Level1/Player").queue_free()
			get_tree().get_root().get_node("Level1/Friend").queue_free()
			
			move_level()
			
			launch = true
		

func move_level():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/" + next_level + ".tscn")
