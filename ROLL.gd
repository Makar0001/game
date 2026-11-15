extends Button
@onready var l = $"../../upgrade/tree/Control"
var rolls = 0
var boost = 1.0
var cooldown = 2
var rollcool = 0
var blue = 0
var green = 0
var white = 0
var epic = 0
var legendary = 0
var mythic = 0
var click = false


func _ready():
	$"../../pan/bluelab".text = str(blue)
	$"../../pan/greenlab".text = str(green)
	randomize()


func _process(delta):
	if rollcool > 0:
		$"../time".visible = true
		rollcool -= delta
		$".".disabled = true
		$"../time".text = "%.1f" % rollcool
	else:
		$".".disabled = false
		$"../time".visible = false
	
	if click == true:
		cooldown -= delta
		if cooldown <= 0:
			cooldown = 0.5
			$".".emit_signal("pressed")


func _on_pressed():
	if rollcool > 0:
		return
	
	rollcool = cooldown
	
	rolls += 1
	$"../counterroll".text = str("Rolls: ", rolls)
	
	if randi() % 2 == 1:
		$"../rune".text = "common"
		$"../Keeping/Runes".text = "common rune"
		$"../Keeping/Boost".text = "x1.1 multi"
		$"../rune".modulate = Color(1.0, 1.0, 1.0, 1.0)
		$"../Keeping/Runes".modulate = Color(1.0, 1.0, 1.0, 1.0)
		$"../Keeping/Boost".modulate = Color(1.0, 1.0, 1.0, 1.0)
		white += 1
		$"../../pan/whitelab".text = str(white)
		boost = 1.1
		return

	if randi() % 4 == 1:
		$"../rune".text = "uncommon"
		$"../rune".modulate = Color(0.522, 0.882, 0.557, 1.0)
		$"../Keeping/Runes".text = "uncommon rune"
		$"../Keeping/Boost".text = "x1.2 multi"
		$"../Keeping/Runes".modulate = Color(0.522, 0.882, 0.557, 1.0)
		$"../Keeping/Boost".modulate = Color(0.522, 0.882, 0.557, 1.0)
		green += 1
		$"../../pan/greenlab".text = str(green)
		boost = 1.2
		return

	if randi() % 10 == 1:
		$"../rune".text = "rare"
		$"../rune".modulate = Color(0.384, 0.863, 0.933, 1.0)
		$"../Keeping/Runes".text = "rare rune"
		$"../Keeping/Boost".text = "x1.3 multi"
		$"../Keeping/Runes".modulate = Color(0.384, 0.863, 0.933, 1.0)
		$"../Keeping/Boost".modulate = Color(0.384, 0.863, 0.933, 1.0)
		blue += 1
		$"../../pan/bluelab".text = str(blue)
		boost = 1.3
		return

	if randi() % 25 == 1:
		$"../rune".text = "epic"
		$"../rune".modulate = Color(0.624, 0.651, 1.0, 1.0)
		$"../Keeping/Runes".text = "epic rune"
		$"../Keeping/Boost".text = "x1.5 multi"
		$"../Keeping/Runes".modulate = Color(0.624, 0.651, 1.0, 1.0)
		$"../Keeping/Boost".modulate = Color(0.624, 0.651, 1.0, 1.0)
		epic += 1
		$"../../pan/epiclab".text = str(epic)
		boost = 1.5
		return

	if randi() % 50 == 1:
		$"../rune".text = "legendary"
		$"../rune".modulate = Color(0.933, 0.71, 0.341, 1.0)
		$"../Keeping/Runes".text = "legendary rune"
		$"../Keeping/Boost".text = "x2.0 multi"
		$"../Keeping/Runes".modulate = Color(0.933, 0.71, 0.341, 1.0)
		$"../Keeping/Boost".modulate = Color(0.933, 0.71, 0.341, 1.0)
		legendary += 1
		$"../../pan/legendarylab".text = str(legendary)
		boost = 2.0
		return

	if randi() % 100 == 1:
		$"../rune".text = "mythic"
		$"../rune".modulate = Color(0.886, 0.0, 0.129, 1.0)
		$"../Keeping/Runes".text = "mythic rune"
		$"../Keeping/Boost".text = "x3.0 multi"
		$"../Keeping/Runes".modulate = Color(0.886, 0.0, 0.129, 1.0)
		$"../Keeping/Boost".modulate = Color(0.886, 0.0, 0.129, 1.0)
		mythic += 1
		$"../../pan/mythiclab".text = str(mythic)
		boost = 3.0
		return

	else:
		$"../rune".text = "common"
		$"../Keeping/Runes".text = "common rune"
		$"../Keeping/Boost".text = "x1.1 multi"
		$"../rune".modulate = Color(1.0, 1.0, 1.0, 1.0)
		$"../Keeping/Runes".modulate = Color(1.0, 1.0, 1.0, 1.0)
		$"../Keeping/Boost".modulate = Color(1.0, 1.0, 1.0, 1.0)
		white += 1
		$"../../pan/whitelab".text = str(white)
		boost = 1.1


func _on_autoroll_pressed():
	click = not click
	$"../Autoroll".text = "Auto: on"
	if click == false:
		$"../Autoroll".text = "Auto: off"
		cooldown = 0.5
