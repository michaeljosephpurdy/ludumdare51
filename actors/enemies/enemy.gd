extends PathFollow2D

class_name Enemy

@export
var hp: int = 10
@export
var speed: int = 100
@export
var texture: Texture2D


func _ready() -> void:
	$Sprite.texture = texture


func _process(delta) -> void:
	self.progress = self.progress + (speed * delta)
	if (hp <= 0):
		queue_free()


func inflict_damage(damage: int) -> void:
	hp = hp - damage
	print('ouch!')

