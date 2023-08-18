extends Node2D

var velocidade = 500

signal resgatou_um_animal_com_o_portal

func _process(_delta):
	recebeEntrada(_delta)
	
	envelopar()

func recebeEntrada(_delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 1 * velocidade * _delta
	if Input.is_key_pressed(KEY_RIGHT):
		position.x += 1 * velocidade * _delta
	if Input.is_key_pressed(KEY_UP):
		position.y -= 1 * velocidade * _delta
	if Input.is_key_pressed(KEY_DOWN):
		position.y += 1 * velocidade * _delta
		

func envelopar():
	if position.x < 0:
		position.x = 1024
	if position.x > 1024:
		position.x = 0
	if position.y < 100:
		position.y = 700
	if position.y > 700:
		position.y = 100


func _on_Area2D_body_entered(body):
	$AnimalSalvo.play()
	emit_signal("resgatou_um_animal_com_o_portal")
	body.queue_free()
