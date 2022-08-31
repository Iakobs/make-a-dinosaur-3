extends Spatial

var dinosaur: Spatial

func _ready():
	dinosaur = $Dinosaur

func _input(event):
	if event.is_action_pressed("ui_accept"):
		dinosaur.toggle_gumminess()
