extends Node2D
signal startGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.self_modulate.a = 0
	$Button.self_modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscenes_start_menu() -> void:
	$Label.self_modulate.a = 1
	$Button.self_modulate.a = 1


func _on_button_pressed() -> void:
	startGame.emit()
