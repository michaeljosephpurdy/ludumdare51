extends Node2D

signal solved_problem
signal failed_problem


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_input_input_submitted(answer: int) -> void:
	if not $MathFact.is_correct_answer(answer):
		failed_problem.emit()
		return
	$MathFact.new_fact()
	Global.add_coin()
	solved_problem.emit()


func lock() -> void:
	$Input.lock()
	set_process_input(false)


func unlock() -> void:
	$Input.unlock()

	set_process_input(true)

