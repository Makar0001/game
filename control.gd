extends Control

var dragg = false
var luck = 0
var count = 0
var costs = 10
var cost = 10
var count2 = 0
var costs2 = 50
var cost2 = 50
var count3 = 0
var costs3 = 100
var cost3 = 100
@onready var t = $"../../../Panel/roll"

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragg = event.pressed
	if event is InputEventMouseMotion and dragg:
		position += event.relative


func _on_uptree_pressed():
	if t.rolls >= cost:
		t.cooldown -= 0.5
		cost *= 2
		costs *= 2
		count += 1
		$line2.visible = true
		$uptree3.visible = true
		$uptree/costs.text = str("Costs: ", costs, " rolls")
		$uptree/countup.text = str("(", count, "/3)")
		
	if count >= 3:
		$uptree.disabled = true
		$uptree/costs.text = "MAX"

func _on_uptree_3_pressed():
	if t.rolls >= cost3:
		$"../../../Panel/Autoroll".visible = true
		count3 += 1
		$uptree3/countup3.text = str("(", count3, "/1)")
	
	if count3 >= 1:
		$uptree3.disabled = true
		$uptree3/costs3.text = "MAX"
