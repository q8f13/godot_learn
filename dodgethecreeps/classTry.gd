extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#class_name AllHailClass, 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var this = AllHaiClass
	var cppNode = MyCppNode.new()
	cppNode.queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
