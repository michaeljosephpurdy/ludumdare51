extends Control

signal purchased(Turret)

var _item: Turret

func _ready() -> void:
	for child in get_children():
		if child is Turret:
			_item = child
	$VBoxContainer/CostLabel.text = 'cost: ' + str(_item.cost)
	$VBoxContainer/DamageLabel.text = 'damage: ' + str(_item.damage)
	$VBoxContainer2/RadiusLabel.text = 'range: ' + str(_item.radius)
	$VBoxContainer2/FireRateLabel.text = 'speed: ' + str(_item.fire_rate)

func _process(delta: float) -> void:
	$BuyButton.disabled = not Global.can_afford(_item.cost)


func _on_buy_button_pressed():
	purchased.emit(_item)

