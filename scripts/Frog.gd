extends KinematicBody2D

export var GRAVITY: int = 1200

var jump:Vector2 = Vector2(200, -100)
var velocity:Vector2 = Vector2()
const UP = Vector2(0, -1)

func get_input():
	#
	if is_on_floor():
		velocity.x = lerp(velocity.x, 0, .3)
		
		jump()

func _physics_process(_delta):
	velocity.y += _delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
	
func jump():
	yield(get_tree().create_timer(1), "timeout")
	
	var player = get_tree().get_root().get_node("Level2/Player")
	
	if player != null:
		#
		
		print(rand_range(0,5))
		
		var player_pos = player.position
		
		if player_pos.x > position.x:
			velocity.x = jump.x
			velocity.y = jump.y
			
		if player_pos.x < position.x:
			velocity.x = -jump.x
			velocity.y =  jump.y

func _process(delta):
	if !is_on_floor():
		$AnimationPlayer.play("Jump")
		
	else:
		if velocity.x > 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
			
		$AnimationPlayer.play("Idle")
