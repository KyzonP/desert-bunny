extends Node3D

@onready var highScoreText = find_child("HighScoreText")
@onready var startButton = find_child("StartButton")

# Audio
var buttonSound = preload("res://assets/audio/sfx/Blip.wav")

func _ready():
	SaveLoad.load_data()
	
	highScoreText.text = "[center]HIGH SCORE : " + str(Global.highScore)
	
	if is_instance_valid(startButton):
		startButton.pressed.connect(_start)
		
	if not Global.check_not_mobile():
		$UI/Keys.visible = true
	else:
		$UI/Mobile.visible = true

func _start():
	# Audio
	AudioManager.play_sfx(buttonSound)
	
	get_tree().change_scene_to_file("res://levels/level 1/level_1.tscn")
