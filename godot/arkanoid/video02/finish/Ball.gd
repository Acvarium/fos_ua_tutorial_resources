extends KinematicBody2D


const DEFAULT_SPEED = 500.0
var speed = DEFAULT_SPEED

var direction = Vector2.DOWN
var velocity = Vector2()

onready var start_position = global_position

func _ready():
	$RestartTimer.start()
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.collider.name == "Paddle":
			var player = collision.collider
			var x_distance = global_position.x - player.global_position.x
			var width = 32
			var relation = clamp(x_distance / width, -1, 1)
			var angle = 45 * relation
			var angle_rad = deg2rad(angle)
			velocity = Vector2.UP.rotated(angle_rad) * velocity.length()
		else:
			velocity = velocity.bounce(collision.normal)
			if collision.collider.is_in_group("brick"):
				collision.collider.queue_free()
			elif collision.collider.has_method("brick_hit"):
				collision.collider.brick_hit()

func reset_ball():
	global_position = start_position
	speed = 0
	velocity = Vector2()
	$RestartTimer.start()


func _on_RestartTimer_timeout():
	speed = DEFAULT_SPEED
	direction = Vector2.DOWN
	velocity = speed * direction
