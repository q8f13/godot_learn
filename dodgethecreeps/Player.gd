extends Area2D

# signals
signal hit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = 400
var screen_size
var target = Vector2()

func start_new(pos):
	position = pos
	target = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screen_size=get_viewport_rect().size
	hide()
	
func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position

func _process(delta):
	var velocity = Vector2()
	# remove keyboard controls
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1

	if position.distance_to(target) >  10:
		velocity = (target - position).normalized() * speed
	else:
		velocity = Vector2()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if velocity.x != 0:
		$AnimatedSprite.animation="right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation="up"
		$AnimatedSprite.flip_v = velocity.y > 0
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.call_deferred("disabled", true)

