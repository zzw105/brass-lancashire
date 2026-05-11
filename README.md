res://
│
├── autoload/
│   ├── data_manager.gd
│   ├── game_state.gd
│   ├── event_bus.gd
│   ├── command_bus.gd
│   └── fsm.gd
│
├── definitions/
│   ├── area/
│   │   ├── area_definition.gd
│   │   └── area_tres/
│   │
│   ├── city/
│   │   ├── city_definition.gd
│   │   └── city_tres/
│   │
│   ├── industry/
│   │   ├── industry_definition.gd
│   │   └── industry_tres/
│   │
│   └── player/
│       └── player_definition.gd
│
├── runtime/
│   ├── area/
│   │   └── area_runtime_state.gd
│   │
│   ├── player/
│   │   └── player_runtime_state.gd
│   │
│   └── game/
│       └── turn_runtime_state.gd
│
├── commands/
│   ├── base_command.gd
│   ├── build_command.gd
│   ├── sell_command.gd
│   └── pass_command.gd
│
├── rules/
│   ├── build_rules.gd
│   ├── income_rules.gd
│   └── network_rules.gd
│
├── states/
│   ├── base_state.gd
│   ├── player_turn_state.gd
│   └── game_end_state.gd
│
├── systems/
│   ├── save_system.gd
│   ├── replay_system.gd
│   └── ai_system.gd
│
├── ui/
│   ├── main/
│   ├── hud/
│   ├── map/
│   └── panels/
│
├── scenes/
│   ├── main.tscn
│   └── game.tscn
│
└── assets/
	├── sprites/
	├── audio/
	└── fonts/
