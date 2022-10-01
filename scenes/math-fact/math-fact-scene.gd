extends Node2D

signal solved_problem
signal failed_problem


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_input_input_submitted(answer):
	if not $MathFact.is_correct_answer(answer):
		failed_problem.emit()
		return
	$MathFact.new_fact()
	solved_problem.emit()


func _on_timer_finished():
	print('finished!')
	$Input.lock()


func _on_timer_started():
	$Input.unlock()
