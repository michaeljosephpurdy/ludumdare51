extends Node2D


func _ready() -> void:
	Global.add_coin()
	Global.add_coin()
	Global.add_coin()
	Global.add_coin()
	Global.add_coin()
	pass


func _process(delta: float) -> void:
	$CurrentCoinLabel.text = 'Coins: ' + str(Global.get_coin())
	pass

func lock():
	pass

func unlock():
	pass


func _on_item_purchased(turret: Turret):
	print(turret)
