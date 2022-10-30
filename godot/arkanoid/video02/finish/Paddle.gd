extends KinematicBody2D

var speed = 300.0
onready var main_node = get_tree().get_root().get_node("Main")
var mouse_movement = Vector2()

func _ready():
	pass 

func _process(delta):
	pass

func _physics_process(delta):
	var speed_mult = 1.0
	if Input.is_action_pressed("fast"):
		speed_mult = 2.0
		
	var input = Input.get_action_strength("ui_right") - \
		Input.get_action_strength("ui_left")
	if main_node.mouse_captured:
		input = mouse_movement.x
	
	var velocity = Vector2(input * speed * speed_mult, 0)
	move_and_collide(velocity * delta)
	mouse_movement = Vector2()


func _input(event):
	if event is InputEventMouseMotion:
		mouse_movement = event.relative
