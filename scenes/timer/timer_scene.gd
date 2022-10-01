extends Node2D

signal finished
signal started

@onready
var timer: Timer = $Timer
@onready
var progress_bar: ProgressBar = $ProgressBar

func _ready():
	start()


func _process(delta):
	var time_left = timer.time_left
	var total_time = timer.wait_time
	var progress = time_left / total_time
	progress_bar.value = progress * 100


func start():
	$Timer.start()
	started.emit()


func _on_timer_timeout():
	finished.emit()

