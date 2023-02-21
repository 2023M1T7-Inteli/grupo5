extends ParallaxLayer

export var cloud_speed := -100

func _process(delta):
	motion_offset.x += cloud_speed*delta
	if position.x == 1000:
		position.x = 3370
