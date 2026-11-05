extends Node

var highScore : int = 0

func check_not_mobile():
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		return true
	else:
		return false
	
