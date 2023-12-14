extends Node2D


signal game_over_triggered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func new_game() -> void:
	pass

# 
func game_over() -> void:
	get_tree().reload_current_scene()
	game_over_triggered.emit()


func _on_ball_ball_out_of_bounds():
	game_over()
