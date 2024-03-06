extends Node2D

func _ready():
	repeat()

func spawn():
	#var spawned = obstacle.instance()
	#get_parent().add_child(spawned)
	
	#var spawn_pos = global_position
	#spawn_pos.x = spawn_pos.x + rand_range(-1000, 1000)
	
	#spawned.global_position = spawn_pos
	pass

func repeat():
	spawn()
	yield(get_tree().create_timer(1), "timeout")
	repeat()
