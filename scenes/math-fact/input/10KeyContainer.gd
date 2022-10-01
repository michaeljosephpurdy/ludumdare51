extends GridContainer

signal number_selected(number)

@onready
var button_scene = preload('res://scenes/math-fact/input/numeric_button.tscn')

func _ready():
	for i in range(1, 10):
		_add_button_and_bind_signal(i)
	_add_button_and_bind_signal(0)


func _add_button_and_bind_signal(number):
	var button = button_scene.instantiate()
	button.number = number
	button.pressed.connect(self.emit_to_parent.bind(button.number))
	self.add_child(button)


func _process(delta):
	pass


func emit_to_parent(number):
	number_selected.emit(number)

