extends Node2D

var enemy = preload("res://enemy.tscn")

@export var randomVar = 10
@export var enemies: Array[PackedScene]

var max_enemies = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_enemy() -> void:
	for e in range(max_enemies):
		var enemyNode = enemy.instantiate()
		
		enemyNode.position = $spawnLocations/spawn1.position
		
		add_child(enemyNode)


func _on_main_menu_start_game() -> void:
	$ColorRect.visible = false
	$Cutscenes.visible = false
	$MainMenu.visible = false
