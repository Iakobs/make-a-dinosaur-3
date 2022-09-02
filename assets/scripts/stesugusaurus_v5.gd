extends Spatial

var is_original: bool
onready var extra_body: Spatial = $stesugusaurus_body
onready var extra_body_mesh: MeshInstance = $stesugusaurus_body/peppermint_body
export var origin : Material
export var destination: Material

func _ready():
	extra_body.visible = false
	extra_body_mesh.set_surface_material(0, destination)
	$peppermint_body.set_surface_material(0, origin)
	is_original = true

func change_material():
	if is_original:
		origin.flags_transparent = true
		$Tween.interpolate_property(origin, "albedo_color:a", 1.0, 0.0, 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		extra_body.visible = true
	else:
		$peppermint_body.set_surface_material(0, origin)
		is_original = true

func _input(event):
	if event.is_action_pressed("ui_accept") and not $Tween.is_active():
		change_material()

func _on_tween_completed(object, key):
	if is_original:
		extra_body.visible = false
		$peppermint_body.set_surface_material(0, destination)
		origin.flags_transparent = false
		origin.albedo_color.a = 1.0
		is_original = false
