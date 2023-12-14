extends StaticBody2D

# How fast the player will move (pixels/sec)
@export var speed = 400

signal score_updated

# Size of the game window
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size
	Signalbus.connect(Signalbus.block_hit.get_name(), _on_block_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# limit movement to the view screen... ish. Bit hacky
	position += velocity * delta
	position.x = clamp(position.x, 40, screen_size.x - 40)


# This doesn't really make sense to handle in the player script...
func _on_block_hit():
	Globals.score += 1
	score_updated.emit()


func _on_hud_start_game():
	show()
