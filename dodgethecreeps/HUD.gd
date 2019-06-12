extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal start_game

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func show_message(text):
	$MsgLabel.text = text
	$MsgLabel.show()
	$MsgTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MsgTimer, "timeout")
	$MsgLabel.text = "Dodge the\nCreeps"
	$MsgLabel.show()
	yield(get_tree().create_timer(1),"timeout")
	$StartBtn.show()

func update_score(score):
	$ScoreLabel.text = str(score)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		_on_StartBtn_pressed()

func _on_MsgTimer_timeout():
	$MsgLabel.hide()
	pass # replace with function body


func _on_StartBtn_pressed():
	$StartBtn.hide()
	print("start_game")
	emit_signal("start_game")
	pass # replace with function body
