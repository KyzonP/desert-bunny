extends CanvasLayer

func _ready():
	hide() #Hide pause menu
	find_child("ResumeButton").pressed.connect(toggle_pause)
	
	EventBus.togglePause.connect(toggle_pause)
	
func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
	
func toggle_pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
	
	print("pause")
