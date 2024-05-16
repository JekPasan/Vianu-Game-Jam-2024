extends Node

var resetat = false

func start(tburi: Array):
	var i = 0
	while i < len(tburi):
		if not is_instance_valid(tburi[i]) and is_instance_valid(tburi[i+1]):
			tburi[i+1].start()
		i += 1
