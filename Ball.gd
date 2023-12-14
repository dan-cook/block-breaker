extends RigidBody2D

@export var speed = 450
var enabled = false

# x/y coordinates for the direction the ball is heading
# NORTH: 0,-1
# SOUTH: 0,1
# EAST: -1,0
# WEST: 1:0
var direction = Vector2(0,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !enabled:
		return
		
	var velocity = speed * direction * delta
	position += velocity * delta
	
	# check for collision, if so we need to calculate a new direction
	# https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html#doc-vector-math
	var collision = move_and_collide(velocity)
	if collision:
		print_debug(Time.get_datetime_string_from_system(true),' collision')
		
		#need to normalise otherwise you carry forward additional velocity
		direction = collision.get_remainder().bounce(collision.get_normal()).normalized()


func _on_hud_start_game():
	enabled = true
