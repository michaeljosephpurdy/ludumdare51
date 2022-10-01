extends Node2D

class_name Enemy

@export
var hp: int = 10
@export
var speed: int = 10
@export
var texture: Texture2D


func _ready() -> void:
	pass


func _process(delta) -> void:
	if (hp <= 0):
		queue_free()


func inflict_damage(damage: int) -> void:
	hp = hp - damage
	print('ouch!')

