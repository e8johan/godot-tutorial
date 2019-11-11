extends Node2D

func _ready():
	$Label.text = str(no_of_flipped_cards())
	
	$Card.connect("flipped_changed", self, "_on_flipped_changed")
	$Card2.connect("flipped_changed", self, "_on_flipped_changed")

func _on_flipped_changed():
	$Label.text = str(no_of_flipped_cards())

func no_of_flipped_cards() -> int:
	var res : int = 0
	if $Card.flipped:
		res += 1
	if $Card2.flipped:
		res += 1
	return res