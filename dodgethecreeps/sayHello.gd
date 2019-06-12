extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var updateOn = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	print("1515")
	pass

func _notification(what):
	match(what):
		NOTIFICATION_READY:
			print("note ready")

func _on_Button_pressed():
	var s = randomize(1000,9999)
	showText(str(s))
	updateOn = !updateOn
	set_process(updateOn)
	
func showText(s):
	get_node("Label").text = s
