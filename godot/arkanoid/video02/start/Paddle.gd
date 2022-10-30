extends KinematicBody2D

var speed = 300.0

func _ready():
	pass 

func _process(delta):
	pass

func _physics_process(delta):
	var input = Input.get_action_strength("ui_right") - \
		Input.get_action_strength("ui_left")
	var velocity = Vector2(input * speed, 0)
	move_and_collide(velocity * delta)
