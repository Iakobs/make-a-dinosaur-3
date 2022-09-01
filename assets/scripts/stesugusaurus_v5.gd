extends Spatial

var is_original: bool
var origin : Material = $peppermint_body.get_surface_material(0)
export var destination: Material

func _ready():
	is_original = true

func change_material():
	if is_original:
		$AnimationPlayer.play("transition")
	else:
		$peppermint_body.set_surface_material(0, origin)
		is_original = true

func _input(event):
	if event.is_action_pressed("ui_accept"):
		change_material()


func _on_animation_finished(_anim_name):
	$peppermint_body.set_surface_material(0, destination)
	is_original = false
