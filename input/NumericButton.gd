extends Button

@export
var number: int

func _ready():
	self.text = str(number)

