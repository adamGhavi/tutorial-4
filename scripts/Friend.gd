extends KinematicBody2D

const UP = Vector2(0, -1)

export var current_level: String = "Level1"

export var speed: int = 400
export var acc: int = 100
export var GRAVITY: int = 1200
export var jump_speed: int = -700

var velocity: Vector2 = Vector2()

func get_input():
	#
	var friend_pos = position
	var player_pos = get_tree().get_root().get_node(current_level + "/Player").position
	
	#
	if friend_pos.distance_to(player_pos) > 200:
		if is_on_floor() and (abs(player_pos.y - friend_pos.y) > 100):
			velocity.y = jump_speed
		if player_pos.x > friend_pos.x:
			velocity.x += acc
		if player_pos.x < friend_pos.x:
			velocity.x -= acc
	else:
		velocity.x = lerp(velocity.x, 0, .3)
		
	velocity.x = clamp(velocity.x, -speed, speed)
	

func _physics_process(_delta):
	velocity.y += _delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
	

func _process(_delta):
	if velocity.y != 0:
		$Animator.play("Jump")
	elif abs(velocity.x) > 10:
		$Animator.play("Walk")
		if velocity.x > 1:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		$Animator.play("Idle")
