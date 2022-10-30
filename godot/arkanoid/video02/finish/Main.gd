extends Node2D
var mouse_captured = false
var mouse_over_menu = false
var brick_file = preload("res://bricks/Brick.tscn")

func _ready():
	gen_level_from_tiles()


func _on_Bottom_body_entered(body):
	if body.has_method("reset_ball"):
		body.reset_ball()


func _input(event):
	if event.is_action_pressed("mouse_capture_on"):
		capture_mouse(true)
	elif event.is_action_pressed("mouse_capture_off"):
		capture_mouse(false)


func capture_mouse(to_capture):
	if mouse_over_menu:
		to_capture = false
	if to_capture:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = to_capture

func gen_level_from_tiles():
	var tilemap = $LevelHolder/Level/TileMap
	for b in $Bricks.get_children():
		b.free()
	for t in tilemap.get_used_cells():
		var cell_id = tilemap.get_cellv(t)
		var brick_pos = tilemap.map_to_world(t) + tilemap.global_position
		add_brick(brick_pos, cell_id)
	tilemap.visible = false


func add_brick(pos, cell_id):
	var brick = brick_file.instance()
	$Bricks.add_child(brick)
	brick.global_position = pos
	brick.set_type(cell_id)
		
		
		
