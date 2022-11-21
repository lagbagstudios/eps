extends Node

var loader: ResourceInteractiveLoader
var wait_frames: int
var time_max: int = 100
var current_scene: Node
var progress: float = 0
var path: String
var loading: bool = false

# Load current scene on initialization
func _ready() -> void:
	var root: Viewport = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func _process(_delta: float) -> void:
	if loader == null:
		set_process(false)
		return
	
	# Can be used to delay scene change
	if wait_frames > 0:
		wait_frames -= 1
		return
	
	var t: int = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + time_max:
		var err: int = loader.poll()
		if err == ERR_FILE_EOF:
			var resource: Resource = loader.get_resource()
			loader = null
			set_new_scene(resource)
			break
		elif err == OK:
			update_progress()
		else:
			show_error()
			loader = null
			break

func goto_scene(p: String) -> void:
	path = p
	# Load our new scene with high granularity
	loader = ResourceLoader.load_interactive(path)
	if loader == null:
		show_error()
		return
	# Enable the _process(delta) function
	set_process(true)
	# Remove the current scene
	current_scene.queue_free()
	loading = true
	# Wait 1 frame before starting the load (can be changed if animation is added)
	wait_frames = 1

func set_new_scene(resource: Resource) -> void:
	current_scene = resource.instance()
	get_node("/root").add_child(current_scene)

func show_error() -> void:
	printerr("Could not load resource from " + path)
	
func update_progress() -> void:
	progress = float(loader.get_stage()) / loader.get_stage_count()
