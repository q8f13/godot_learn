extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var Mob
var score

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
func new_game():
	score=0
	$Player.start_new($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var dir = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position=$MobPath/MobSpawnLocation.position
	dir += rand_range(-PI/4, PI/4)
	mob.rotation = dir;
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(dir)
	$HUD.connect("start_game", mob, "_on_start_game")

func _on_ScoreTimer_timeout():
	score+=1
	$HUD.update_score(score)
	pass # replace with function body


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	pass # replace with function body


func _on_HUD_start_game():
	new_game()
	pass # replace with function body


func _on_Player_hit():
	game_over()
	pass # replace with function body
