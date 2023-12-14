extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_score_updated():
	print('updating score to ', str(Globals.score))
	$Score.text = str(Globals.score)


func _on_start_pressed():
	$Start.hide()
	start_game.emit()
