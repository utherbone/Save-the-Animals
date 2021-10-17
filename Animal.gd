extends RigidBody2D

func _process(delta):
	if position.y > 632:
		queue_free()
