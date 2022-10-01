extends GridContainer

signal number_selected
@onready
var button_scene = preload('res://numeric_button.tscn')

func _ready():
	if not self.visible:
		return
	for i in range(7, 9):
		_add_button_and_bind_signal(i)
	for i in range(4, 6):
		_add_button_and_bind_signal(i)
	for i in range(1, 3):
		_add_button_and_bind_signal(i)
	_add_button_and_bind_signal(0)
	pass

func _add_button_and_bind_signal(number):
	var button = button_scene.instantiate()
	button.number = number
	button.pressed.connect(self.emit_to_parent.bind(button.number))
	self.add_child(button)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func emit_to_parent(number):
	emit_signal('number_selected', number)
	pass
