extends Control

signal start_game

onready var label: Label = $MarginContainer/Label

func _ready() -> void:
	label.text = "Press any key to start..."

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		emit_signal("start_game")
		label.text = "Game started"
