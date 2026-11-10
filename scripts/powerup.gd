extends Area3D

# Audio
var powerupSound = preload("res://assets/audio/sfx/PowerUp.wav")

func _ready():
	area_entered.connect(collide)

func destroy():
	# Audio
	AudioManager.play_sfx(powerupSound)
	
	EventBus.powerup_activated.emit()
	
	self.queue_free()

func collide(_area):
	destroy()
