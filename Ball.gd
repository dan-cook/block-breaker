extends RigidBody2D

var speed = 300
var velocity = 0

# x/y coordinates for the direction the ball is heading
# NORTH: 0,-1
# SOUTH: 0,1
# EAST: -1,0
# WEST: 1:0
var direction = Vector2(0,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = speed * direction * delta
	position += velocity * delta
	
	
	# check for collision, if so we need to calculate a new direction
	# https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html#doc-vector-math
	var collision = move_and_collide(velocity)
	if collision:
		print('collision')
		direction = collision.get_remainder().bounce(collision.get_normal())

		#velocity = velocity.bounce(collision.get_normal())
		#move_and_collide(reflect)
