extends NinePatchRect

@onready var chest =  $AnimatedSprite2D


func _ready():
	hide()
	$Open.show()
	$Close.hide()
	
	open()

func open():
	chest.play("idle_boss_chest")
	get_tree().paused = true
	show()
	$Open.show()
	$Close.hide()


func _on_open_pressed() -> void:
	chest.play("open_boss_chest")


func _on_close_pressed() -> void:
	pass # Replace with function body.

func set_reward():
	var chance = randf()
	if chance < 0.5 :
		print("rare")
	elif chance < 0.75 :
		print("epic")
	else :
		print("legendary")
