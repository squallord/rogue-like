extends Area2D

enum PlayerFacing {FRONT, BACK, LEFT, RIGHT}
enum AnimState {IDLE, RUNNIG}

# Declare member variables here. Examples:
export var speed = 100
var screen_size
var orientation
var animState
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	orientation = PlayerFacing.FRONT
	animState = AnimState.IDLE
	pass # Replace with function body.

func _playAnim():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		orientation = PlayerFacing.LEFT
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		orientation = PlayerFacing.RIGHT
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		orientation = PlayerFacing.BACK
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		orientation = PlayerFacing.FRONT
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animState = AnimState.RUNNING
	else:
		animState = AnimState.IDLE
		
	_playAnim()
	position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	pass
