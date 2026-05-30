extends Node
## 游戏数据

## 游戏数据-玩家信息
var players = []

## 游戏数据-当前玩家
var current_player_id = 0
## 游戏数据-当前玩家
var current_player_remaining_actions = 2

## 游戏数据-区域
var areas: Dictionary[StringName, AreaRuntimeState] = {}
## 游戏数据-城市
var cities: Dictionary[StringName, CityRuntimeState] = {}
## 游戏数据-产业
var industries: Dictionary[StringName, IndustryRuntimeState] = {}
## 游戏数据-市场
var markets: Dictionary[StringName, MarketRuntimeState] = {}


## 游戏数据-初始化
func setup():
	setupIndustry()
	setupAreas()
	setupCities()
	setupMarkets()

## 游戏数据-初始化城市
func setupCities():
	for city_id in DataManager.cities:
		cities[city_id] = CityRuntimeState.new(city_id)
		# 城市id添加进区域
		# for area_id in area_ids:
		# 	areas[area_id].city_id = city_id
			

## 游戏数据-初始化区域
func setupAreas():
	for area_id in DataManager.areas:
		var area_definition = DataManager.get_area(area_id)
		var can_industry_ids: Array[StringName] = []
		for item in area_definition.can_industry_list:
			can_industry_ids.append(item.id)
		areas[area_id] = AreaRuntimeState.new(area_id, can_industry_ids)
		

## 游戏数据-初始化产业
func setupIndustry():
	for industry_id in DataManager.industries:
		industries[industry_id] = IndustryRuntimeState.new(industry_id)

## 游戏数据-初始化市场
func setupMarkets():
	for market_id in DataManager.markets:
		var market_runtime_state = MarketRuntimeState.new(market_id)
		markets[market_id] = market_runtime_state
