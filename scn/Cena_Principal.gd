extends Node2D

var gerador = RandomNumberGenerator.new()
var pontos = 0

var instRaposa = preload("res://scn/Raposa.tscn")
var instFrog = preload("res://scn/Frog.tscn")
var instPassaro = preload("res://scn/Passaro.tscn")
var instVaca = preload("res://scn/Vaca.tscn")
var instCat = preload("res://scn/Cat.tscn")
var instCoelho = preload("res://scn/Coelho.tscn")
var instDog = preload("res://scn/Dog.tscn")

func _ready():
	$Timer.start()
	gerador.randomize()
	
func criarAnimais():
	var instance
	var tmp = gerador.randi_range(0, 6)
	
	match tmp:
		0:
			instance = instRaposa.instantiate()
		1:
			instance = instFrog.instantiate()
		2:	
			instance = instPassaro.instantiate()
		3:
			instance = instVaca.instantiate()
		4:
			instance = instCoelho.instantiate()
		5:
			instance = instCat.instantiate()
		6:
			instance = instDog.instantiate()
			
	instance.position.y = -16
	instance.position.x = gerador.randf_range(26,1000)
	instance.rotation = gerador.randf_range(-1.5,1.5)
	add_child(instance)

func _on_Timer_timeout():
	criarAnimais()
	$Timer.start()
	


func _on_Portal_resgatou_um_animal_com_o_portal():
	pontos += 1
	$Label.text = str(pontos)

func _on_Cena_Principal_draw():
	$ambient.play()
