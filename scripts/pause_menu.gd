extends CanvasLayer

# Audio
var buttonSound = preload("res://assets/audio/sfx/Blip.wav")

func _ready():
	hide() #Hide pause menu
	find_child("ResumeButton").pressed.connect(toggle_pause)
	find_child("QuitButton").pressed.connect(quit)
	
	EventBus.togglePause.connect(toggle_pause)
	
func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
	
func toggle_pause():
	# Audio
	AudioManager.play_sfx(buttonSound)
	
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
	
func quit():
	# Audio
	AudioManager.play_sfx(buttonSound)
	
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
