extends Node

var DIR = OS.get_executable_path().get_base_dir()
var interpreterPath = DIR.path_join("Python/venv/Scripts/python.exe")
var scriptPath = DIR.path_join("Python/mail.py")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	send("", "test", "test")
func send(to, subject, messageTxt):
	OS.execute(interpreterPath, [scriptPath,to,subject,messageTxt])
	print("here")
