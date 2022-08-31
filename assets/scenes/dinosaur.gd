extends Spatial

const GUMMY_MIN_VALUE: float = 0.0
const GUMMY_MAX_VALUE: float = 1.0

export var gumminess: float = 0.0
var is_gummy: bool = false

var material: ShaderMaterial
	
func _ready():
	material = get_material()

func get_material() -> ShaderMaterial:
	return $Body.get_active_material(0)
	
func _process(delta):
	material.set_shader_param("gumminess", gumminess)

func toggle_gumminess() -> void:
	match gumminess:
		GUMMY_MIN_VALUE:
			$GummyTween.interpolate_property(self, "gumminess",
											 GUMMY_MIN_VALUE, GUMMY_MAX_VALUE,
											 5.0, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$GummyTween.start()
		GUMMY_MAX_VALUE:
			$GummyTween.interpolate_property(self, "gumminess",
											 GUMMY_MAX_VALUE, GUMMY_MIN_VALUE,
											 5.0, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$GummyTween.start()
		_:
			print_debug(gumminess)

func _on_GummyTween_tween_completed(object, key):
	is_gummy = true if gumminess == GUMMY_MAX_VALUE else false 
