extends Control

signal purchased(Turret)

var _item: Turret
var _cost: int
const _item_offset:Vector2 = Vector2(80, 80)

func _ready() -> void:
	for child in get_children():
		if child is Turret:
			_item = child
	_item.position += _item_offset
	_cost = _item.get_cost()
	var damage: String
	var radius: String
	var fire_rate: String
	var effect: String = ''
	match _item.type:
		Global.TurretType.Sauce:
			damage = 'normal'
			radius = 'high'
			fire_rate = 'normal'
		Global.TurretType.Pepperoni:
			damage = 'low'
			radius = 'low'
			fire_rate = 'low'
			effect = 'slow down'
		Global.TurretType.Dough:
			damage = 'high'
			radius = 'normal'
			fire_rate = 'slow'
		_:
			assert(false, 'unimplemented turret type')
	$HFlowContainer/VBoxContainer/DamageLabel.text = 'damage: ' + damage
	$HFlowContainer/VBoxContainer/RadiusLabel.text = 'range: ' + radius
	$HFlowContainer/VBoxContainer/FireRateLabel.text = 'fire rate: ' + fire_rate
	if (effect != ''):
		$HFlowContainer/VBoxContainer2/EffectLabel.visible = true
		$HFlowContainer/VBoxContainer2/EffectLabel.text = 'effects:\n' + effect
	$HFlowContainer/VBoxContainer2/CostLabel.text = 'cost: ' + str(_cost)


func _process(delta: float) -> void:
	$BuyButton.disabled = not Global.can_afford(_cost)


func _on_buy_button_pressed():
	purchased.emit(_item)

