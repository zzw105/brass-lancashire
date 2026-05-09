class_name BuildIndustryCommand
extends BaseCommand

var player_id
var industry_type

func _init(p_player_id, p_type):
	player_id = p_player_id
	industry_type = p_type


func validate(state):
	
	var player = state.players[player_id]

	return player.money >= 10


func execute(state):

	var player = state.players[player_id]

	player.money -= 10

	state.industries.append({
		"owner": player_id,
		"type": industry_type
	})


func undo(state):

	var player = state.players[player_id]

	player.money += 10

	state.industries.pop_back()
