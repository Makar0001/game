extends Node2D
var run
var ct = 0
var sp = 0.1
var s = 0
var speed = 0.01
var cost = 5
var cost1 = 15
var SS = false
@onready var i = $CanvasLayer/upgrade/tree/Control2
@onready var m = $CanvasLayer/Panel/roll


func _ready():
	$CanvasLayer/Label.text = str(ct)
	$CanvasLayer/Button2.text = str("Buy boost x2: ", sp)
	$CanvasLayer/n_persec.text = str("(", s, "/s)")
	$CanvasLayer/Button5.text = str("Buy shiny star (lvl 1)       : ", cost)
	$CanvasLayer/Button8.text = str("Buy an additional upgrade in the tree 'α': ", cost1)


func number(n):
	if n >= 1000000000:
		return "%.1fB" % (n / 1000000000)
	elif n >= 1000000:
		return "%.1fM" % (n / 1000000)
	elif n >= 1000:
		return "%.1fk" % (n / 1000)
	return "%.2f" % n


func _on_button_pressed():
	run = true
	$CanvasLayer/Button.visible = false


func _process(delta: float) -> void:
	if run == true:
		s = speed * m.boost * i.boostct
		ct += speed * m.boost * i.boostct * delta
		$CanvasLayer/Label.text = number(ct) + "α"
		$CanvasLayer/Panel4/numbersh.text = number(ct)
		$CanvasLayer/n_persec.text = str("(", "%.3f" % s, "/s)")


func _on_button_2_pressed():
	if ct >= sp:
		ct = ct - sp
		speed = speed * 2
		sp = sp * 3
		$CanvasLayer/Button2.text = str("Buy boost x2: ", sp)
	if sp >= 2.7:
		$CanvasLayer/Button2.disabled = true
		$CanvasLayer/Button2.text = "MAX"


func _on_button_3_pressed():
	$CanvasLayer/Panel.visible = !$CanvasLayer/Panel.visible


func _on_settings_pressed():
	$CanvasLayer/Panel/settings/set.visible = !$CanvasLayer/Panel/settings/set.visible


func _on_close_pressed():
	$CanvasLayer/upgrade/tree.visible = false


func _on_upgrade_pressed():
	$CanvasLayer/upgrade/tree.visible = true


func _on_openrune_pressed():
	$CanvasLayer/pan.position -= Vector2(0, -200)
	$CanvasLayer/closerune.visible = true
	$CanvasLayer/closerune.position -= Vector2(0, -200)
	$CanvasLayer/openrune.position -= Vector2(0, -200)
	$CanvasLayer/openrune.visible = false


func _on_closerune_pressed():
	$CanvasLayer/pan.position += Vector2(0, -200)
	$CanvasLayer/openrune.position += Vector2(0, -200)
	$CanvasLayer/closerune.visible = false
	$CanvasLayer/openrune.visible = true
	$CanvasLayer/closerune.position += Vector2(0, -200)


func _on_alphatree_pressed():
	$CanvasLayer/upgrade/tree/Control3.visible = false
	$CanvasLayer/upgrade/tree/Control2.visible = true
	$CanvasLayer/upgrade/tree/Control.visible = false


func _on_alphatree_2_pressed():
	$CanvasLayer/upgrade/tree/Control3.visible = false
	$CanvasLayer/upgrade/tree/Control2.visible = false
	$CanvasLayer/upgrade/tree/Control.visible = true


func _on_button_5_pressed():
	if ct >= cost:
		ct = ct - cost
		speed = speed + 0.3
		$CanvasLayer/Button5.disabled = true
		$CanvasLayer/Button5.text = "MAX"
		$CanvasLayer/Button5/Star.visible = false
		$CanvasLayer/Panel3/pp/Star.modulate = Color(1.0, 1.0, 1.0, 1.0)
		$CanvasLayer/Panel3/pp/opis.text = "Shiny star"
		$CanvasLayer/Button8.visible = true
		SS = true


func _on_pp_pressed():
	if SS == true:
		$CanvasLayer/Panel3/Panel00/nad.text = "Shiny star - 
		gives a boost + 0.3"
		$CanvasLayer/Panel3/Panel00/Star.visible = true
		$CanvasLayer/Button8.visible = true


func _on_button_8_pressed():
	if ct >= cost1:
		ct = ct - cost1
		$CanvasLayer/upgrade/tree/Control2/secuptreea1.visible = true
		$CanvasLayer/upgrade/tree/Control2/line01.visible = true
		$CanvasLayer/Button8.disabled = true
		$CanvasLayer/Button8.text = "MAX"


func _on_alphatree_3_pressed():
	$CanvasLayer/upgrade/tree/Control3.visible = true
	$CanvasLayer/upgrade/tree/Control2.visible = false
	$CanvasLayer/upgrade/tree/Control.visible = false


func _on_button_9_pressed():
	$CanvasLayer/Panel4.visible = !$CanvasLayer/Panel4.visible
