extends GridContainer

signal number_selected(number)

@onready
var button_scene: PackedScene = preload('res://scenes/math-fact/input/numeric-button.tscn')

func _ready() -> void:
	for i in range(7, 10):
		_add_button_and_bind_signal(i)
	for i in range(4, 7):
		_add_button_and_bind_signal(i)
	for i in range(1, 4):
		_add_button_and_bind_signal(i)
	_add_button_and_bind_signal(0)


func _add_button_and_bind_signal(number: int) -> void:
	var button = button_scene.instantiate()
	button.number = number
	button.pressed.connect(self.emit_to_parent.bind(button.number))
	self.add_child(button)


func _process(delta: float) -> void:
	pass


func emit_to_parent(number: int) -> void:
	emit_signal('number_selected', number)

