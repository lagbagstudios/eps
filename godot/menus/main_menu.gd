extends Control

onready var main_bg = $Background
onready var main_buttons = $Buttons

onready var start_button = $Buttons/VB/StartButton
onready var quit_button = $Buttons/VB/QuitButton
onready var options_button = $Buttons/VB/OptionsButton

onready var quit_modal = $QuitDialogue
onready var yes_quit_button = $QuitDialogue/Buttons/HB/Yes
onready var no_quit_button = $QuitDialogue/Buttons/HB/No

onready var anim = $AnimationPlayer

func _ready() -> void:
	start_button.connect("button_down", self, "start_game")
	options_button.connect("button_down", self, "options")
	quit_button.connect("button_down", self, "quit")
	yes_quit_button.connect("button_down", self, "yes_quit")
	no_quit_button.connect("button_down", self, "no_quit")

func start_game():
	print_debug("start_game")
	SceneHandler.goto_scene(Globals.CUTSCENE1_TSCN)

func options():
	print_debug("options")

func quit():
	anim.play("Show Quit Modal")

func yes_quit():
	get_tree().quit()

func no_quit():
	anim.play("Hide Quit Modal")

func disable_main_buttons():
	start_button.disabled = true
	quit_button.disabled = true
	options_button.disabled = true

func enable_main_buttons():
	start_button.disabled = false
	quit_button.disabled = false
	options_button.disabled = false
