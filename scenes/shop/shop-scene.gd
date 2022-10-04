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
	$CurrentZombieLabel.text = 'Zombies killed: ' + str(Global._zombies_killed) + '/' + str(Global.ZOMBIES)


func lock() -> void:
	set_process_input(false)
	pass


func unlock() -> void:
	set_process_input(true)
	pass


func _on_item_purchased(turret: Turret) -> void:
	Global.deduct_cost(turret.get_cost())
	Global.add_purchased_item(turret.duplicate())

