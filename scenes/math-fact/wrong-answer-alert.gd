extends Node2D

class_name WrongAnswerAlert

func _ready() -> void:
	print(self)
	$AnimationPlayer.play('math-fact-alerts/failed-answer')

func _process(delta: float) -> void:
	pass
