extends CanvasLayer

var base:Node
var text:Node
var player:Node
var jumps = 0

onready var pos = $Control

func _ready():
	base = get_node("/root/base")
	player = get_node("/root/base/player")
	text = load("res://level stuff/text.tscn").instance()
	pos.add_child(text)
	
	pos.position = Vector2(5, 5)

func _process(delta):
	if base.state == "play":
		if (player.raycast("floor") || player.raycast("left") || player.raycast("right")):
			if Input.is_action_just_pressed("jump"):
				jumps += 1
	text.bbcode_text = jumps
	
