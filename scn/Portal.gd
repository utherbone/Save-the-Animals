extends Node2D

var velocidade = 300

signal resgatou_um_animal_com_o_portal

func _process(delta):
	recebeEntrada(delta)
	
	envelopar()

func recebeEntrada(delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 1 * velocidade * delta
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 1 * velocidade * delta
	elif Input.is_key_pressed(KEY_UP):
		position.y -= 1 * velocidade * delta
	elif Input.is_key_pressed(KEY_DOWN):
		position.y += 1 * velocidade * delta

func envelopar():
	if position.x < 0:
		position.x = 1024
	elif position.x > 1024:
		position.x = 0
	if position.y < 100:
		position.y = 700
	elif position.y > 700:
		position.y = 100


func _on_Area2D_body_entered(body):
	$AnimalSalvo.play()
	emit_signal("resgatou_um_animal_com_o_portal")
	body.queue_free()
