extends StaticBody2D
var indistractable = false
var hit_points = 1


func brick_hit():
	if indistractable:
		return
	hit_points -= 1
	if hit_points <= 0:
		queue_free()


func set_type(id):
	$Sprite.frame = id
	indistractable = id == 9
	if id == 8:
		hit_points = 4
