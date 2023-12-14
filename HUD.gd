extends CanvasLayer

signal start_game

var started = false
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause") && started:
		get_tree().paused = !paused
		paused = !paused
		print('pause')


func _on_player_score_updated():
	$Score.text = str(Globals.score)


func _on_start_pressed():
	$Start.hide()
	start_game.emit()
	started = true
	await get_tree().create_timer(1.5).timeout
	$Pause.hide()
