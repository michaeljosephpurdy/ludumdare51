extends Node2D


func _ready() -> void:
	Global.set_next_state(Global.State.MATH_FACT)
	_on_fader_fade_out_finished()

func _process(delta: float) -> void:
	pass


func _get_scene(state: int) -> Node:
	match (state):
		Global.State.BUY_STAGE:
			return $ShopScene
		Global.State.DEFEND:
			return $Maze
		Global.State.MATH_FACT:
			return $MathFactScene
		_:
			return null


func _on_timer_started() -> void:
	pass


func _on_timer_finished() -> void:
	var scene = _get_scene(Global.get_current_state())
	scene.lock()
	$TimesUp.times_up()


func _on_times_up_done() -> void:
	$Fader.fade_out()
	match (Global.get_current_state()):
		Global.State.MATH_FACT:
			Global.set_next_state(Global.State.BUY_STAGE)
		Global.State.DEFEND:
			Global.set_next_state(Global.State.MATH_FACT)
		Global.State.BUY_STAGE:
			Global.set_next_state(Global.State.DEFEND)
		_:
			assert(false)
			return null


func _on_fader_fade_in_finished():
	var scene = _get_scene(Global.get_current_state())
	scene.unlock()
	$Timer.start()


func _on_fader_fade_out_finished():
	var current_scene = _get_scene(Global.get_current_state())
	current_scene.visible = true
	var previous_scene = _get_scene(Global.get_previous_state())
	previous_scene.visible = false
	$Fader.fade_in()

