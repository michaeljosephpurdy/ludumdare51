extends PathFollow2D

class_name Enemy

@export
var hp: int = 10
@export
var speed: int = 100
@export
var texture: Texture2D
var id: int


func _ready() -> void:
	$Sprite.texture = texture


func _process(delta) -> void:
	if (Global.get_current_state() != Global.State.DEFEND): return
	self.progress = self.progress + (speed * delta)
	if (hp <= 0):
		queue_free()


func inflict_damage(damage: int) -> void:
	hp = hp - damage
	$AnimationPlayer.play('hit')

