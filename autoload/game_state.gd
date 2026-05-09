extends Node

var players = []
var industries = []

var current_player = 0
var remaining_actions = 2

func setup():
	players = [
		{
			"id": 0,
			"money": 30
		},
		{
			"id": 1,
			"money": 30
		}
	]
	industries = []
