extends Control

var dragg
var B = 0
var cost = 2000
@onready var c = $"../../../.."


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragg = event.pressed
	if event is InputEventMouseMotion and dragg:
		position += event.relative


func _on_treeup_pressed():
	if c.ct >= cost:
		c.ct -= cost
		B += 1
		$"../../../Panel4/numbersh2".text = str(B)
		$"../../../Label4".text = str(B)
