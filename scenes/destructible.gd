extends Sprite2D

var frame_counter = 0
var separation : float
var health : float = 10:
	set(value):
		health = value
		if health<=0:
			drop_item()

@onready var player_reference = get_tree().current_scene.find_child("Player")
var drop_node = preload("res://scenes/pickups.tscn")
@export var drops : Array[Pickups]

func _physics_process(delta):
	frame_counter +=1
	if frame_counter >=6:
		frame_counter = 0
		frame = (frame + 1) % (hframes * vframes)
		
		separation = (player_reference.position - position).length()
		if separation < player_reference.nearest_enemy_distance:
			player_reference.nearest_enemy = self

func take_damage(amount):
	health -= amount
	
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(3,0.25,0.25),0.1)
	tween.chain().tween_property(self,"modulate", Color(1,1,1),0.1)
	
	tween.bind_node(self)

func drop_item():
	var item = drops.pick_random()
	
	var item_to_drop = drop_node.instantiate()
	
	item_to_drop.type = item
	item_to_drop.position = position
	item_to_drop.player_reference = player_reference
	
	get_tree().current_scene.call_deferred("add_child", item_to_drop)
	queue_free()
