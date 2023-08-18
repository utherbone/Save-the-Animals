extends RigidBody2D

func _process(_delta):
	if position.y > 632:
		queue_free()
