extends Node

var current_scene = null

# https://www.youtube.com/watch?v=RMdf60IAxY0&t=888s

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print_debug(current_scene)

func switch_scene(res_path):
	call_deferred("_deffered_switch_scene", res_path)
	
func _deffered_switch_scene(res_path):
	current_scene.free()
	var scene = load(res_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene