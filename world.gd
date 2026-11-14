extends Node2D

func _ready():
	load_game()


func save():
	var save_dict = {
		"name":"Piaz_19"
		
		
	}
	return save_dict

func save_game():
	var save_game = FileAccess.open("C:\\Users\\seife\\AppData\\Roaming\\Soul_Fire_Save\\save_game.save.txt",FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)
	
func load_game():
	if not FileAccess.file_exists("C:\\Users\\seife\\AppData\\Roaming\\Soul_Fire_Save\\save_game.save.txt"):
		return
	
	var save_game = FileAccess.open("C:\\Users\\seife\\AppData\\Roaming\\Soul_Fire_Save\\save_game.save.txt", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		
		print(node_data)
	
