extends Control

var dragg = false
var count = 0
var costs = 35
var cost = 3
var cost1 = 10
var cost2 = 35
var cost3 = 20
var cost4 = 100
var seccost = 20
var count1 = 0
var count2 = 0
var count3 = 0
var count4 = 0
var count5 = 0
var boostct = 1.0
@onready var c = $"../../../.."
@onready var h = $"../../../.."


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragg = event.pressed
	if event is InputEventMouseMotion and dragg:
		position += event.relative


func _on_uptreea_pressed():
	if c.ct >= cost:
		c.ct -= cost
		boostct += 0.5
		count += 1
		$uptreea2.visible = true
		$line05.visible = true
		$uptreea/countup0.text = str("(", count, "/1)")
	
	if count >= 1:
		$uptreea.disabled = true
		$uptreea/costs0.text = "MAX"


func _on_uptreea_2_pressed():
	if c.ct >= cost1:
		c.ct -= cost1
		boostct *= 2
		count1 += 1
		$uptreea2/countup01.text = str("(", count1, "/1)")
		$uptreea3.visible = true
		$uptreea5.visible = true
		$line06.visible = true
		$line03.visible = true
	
	if count1 >= 1:
		$uptreea2.disabled = true
		$uptreea2/costs01.text = "MAX"


func _on_secuptreea_1_pressed():
	if c.ct >= seccost:
		c.ct -= seccost
		boostct *= 3
		count2 += 1
		$"secuptreea1/countup?".text = str("(", count2, "/1)")
	
	if count2 >= 1:
		$secuptreea1.disabled = true
		$"secuptreea1/costs?".text = "MAX"


func _on_uptreea_3_pressed():
	if c.ct >= cost2:
		c.ct -= cost2
		boostct *= 1.5
		cost2 += 35
		costs += 35
		count3 += 1
		$uptreea3/countup02.text = str("(", count3, "/5)")
		$uptreea3/costs02.text = str("Costs: ", costs, "α")
		$line04.visible = true
		$uptreea6.visible = true
	
	if count3 >= 5:
		$uptreea3.disabled = true
		$uptreea3/costs02.text = "MAX"


func _on_uptreea_5_pressed():
	if c.ct >= cost3:
		c.ct -= cost3
		h.speed = h.speed + 0.5
		count4 += 1
		$uptreea5/countup04.text = str("(", count4, "/1)")
	
	if count4 >= 1:
		$uptreea5.disabled = true
		$uptreea5/costs04.text = "MAX"


func _on_uptreea_6_pressed():
	if c.ct >= cost4:
		c.ct -= cost4
		count5 += 1
		$"../alphatree3".visible = true
	
	if count5 >= 1:
		$uptreea6.disabled = true
		$uptreea6/costs05.text = "MAX"
