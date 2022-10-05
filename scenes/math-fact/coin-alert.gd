extends Sprite2D

class_name CoinAlert

func _ready() -> void:
	$AnimationPlayer.play('math-fact-alerts/successful-answer-animation')


func _process(delta: float) -> void:
	pass
