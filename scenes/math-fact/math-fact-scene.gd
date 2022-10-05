extends Control

signal solved_problem
signal failed_problem

@onready
var CoinAlert = preload('res://scenes/math-fact/coin-alert.tscn')
@onready
var WrongAnswerAlert = preload('res://scenes/math-fact/wrong-answer-alert.tscn')

var _alerting: bool

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_input_input_submitted(answer: int) -> void:
	if not $MathFact.is_correct_answer(answer):
		var wrong_answer_alert = WrongAnswerAlert.instantiate()
		$AlertPlacement.add_child(wrong_answer_alert)
		failed_problem.emit()
		return
	var coin_alert = CoinAlert.instantiate()
	$AlertPlacement.add_child(coin_alert)
	$MathFact.new_fact()
	solved_problem.emit()
	Global.add_coin()
	return


func lock() -> void:
	$Input.lock()
	set_process_input(false)


func unlock() -> void:
	$Input.unlock()
	set_process_input(true)

