extends Node2D

signal flipped_changed
var flipped : bool = false setget set_flipped

onready var front = $Front
onready var back = $Back

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT:
			set_flipped(front.visible)

func set_flipped(f : bool) -> void:
	front.visible = !f
	back.visible = f
	flipped = f
	emit_signal("flipped_changed")
