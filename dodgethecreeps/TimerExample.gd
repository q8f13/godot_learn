extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal my_signal

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	self.connect("my_signal", self, "_signalReceived")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _signalReceived():
	print("custom signal received")

func _on_Timer_timeout():
#	$Sprite.visible = !$Sprite.visible
	emit_signal("my_signal")
	pass # replace with function body
