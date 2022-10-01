extends Node2D

enum State {
	MATH_FACT,
	BUY_STAGE,
	PLACE_STAGE,
	DEFEND,
	MAIN_MENU,
	GAME_OVER,
	TITLE,
}

var current_state: State
var previous_state: State


func _ready():
	previous_state = State.TITLE
	current_state = State.MATH_FACT


func _process(delta):
	if (current_state == previous_state):	return
	match(current_state):
		State.MATH_FACT:
			$MathFactScene.show()
		_:
			$MathFactScene.hide()
