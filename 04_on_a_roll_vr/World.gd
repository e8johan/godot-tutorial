extends Spatial

func _ready():
    var interface = ARVRServer.find_interface("Native mobile")
    if interface and interface.initialize():
        get_viewport().arvr = true

