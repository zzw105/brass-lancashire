extends Node
## 静态游戏数据

## 静态游戏数据-城市
var cities: Dictionary[StringName, CityDefinition] = {}
## 静态游戏数据-区域
var areas: Dictionary[StringName, AreaDefinition] = {}
## 静态游戏数据-产业
var industries: Dictionary[StringName, IndustryDefinition] = {}
## 静态游戏数据-道路
var links: Dictionary[StringName, LinkDefinition] = {}
## 静态游戏数据-市场
var markets: Dictionary[StringName, MarketDefinition] = {}
## 静态游戏数据-贸易板块卡牌
var trade_cards: Dictionary[StringName, TradeCardDefinition] = {}


## 静态游戏数据-加载全部静态数据
func load_definitions():
	# 加载静态数据
	load_industries()
	load_areas()
	load_cities()
	load_links()
	load_trade_sectors()
	# 整理静态数据
	sort_dictionary()

	# 发送加载完成事件
	EventBus.global_event_changed.emit(EventBus.GlobalEvent.LOAD_DEFINITIONS_COMPLETE)


## 静态游戏数据-获取-城市静态数据
func get_city(id: StringName) -> CityDefinition:
	if !cities.has(id):
		push_error("cities not found: %s" % id)
		return null
	return cities[id]

## 静态游戏数据-获取-区域静态数据
func get_area(id: StringName) -> AreaDefinition:
	if !areas.has(id):
		push_error("Area not found: %s" % id)
		return null
	return areas[id]

## 静态游戏数据-获取-产业静态数据
func get_industry(id: StringName) -> IndustryDefinition:
	if !industries.has(id):
		push_error("industries not found: %s" % id)
		return null
	return industries[id]

## 静态游戏数据-获取-道路静态数据
func get_link(id: StringName) -> LinkDefinition:
	if !links.has(id):
		push_error("links not found: %s" % id)
		return null
	return links[id]


## 静态游戏数据-加载-区域静态数据
func load_areas():
	var dir = DirAccess.open("res://definitions/area/area_tres/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var area: AreaDefinition = load("res://definitions/area/area_tres/" + file)
			areas[area.id] = area

## 静态游戏数据-加载-产业静态数据
func load_industries():
	var dir = DirAccess.open("res://definitions/industry/industry_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var industry = load("res://definitions/industry/industry_tres/" + file)
			industries[industry.id] = industry

## 静态游戏数据-加载-城市静态数据
func load_cities():
	var dir = DirAccess.open("res://definitions/city/city_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var city = load("res://definitions/city/city_tres/" + file)
			cities[city.id] = city

## 静态游戏数据-加载-道路静态数据
func load_links():
	var dir = DirAccess.open("res://definitions/link/link_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var link = load("res://definitions/link/link_tres/" + file)
			links[link.id] = link

## 静态游戏数据-加载-市场静态数据
func load_markets():
	var dir = DirAccess.open("res://definitions/market/market_tres")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var market = load("res://definitions/market/market_tres/" + file)
			markets[market.id] = market


## 静态游戏数据-加载-贸易板块卡牌
func load_trade_sectors():
	var dir = DirAccess.open("res://definitions/trade_card/trade_card_tres/")

	dir.list_dir_begin()

	while true:
		var file = dir.get_next()

		if file == "":
			break

		if file.ends_with(".tres"):
			var card: TradeCardDefinition = load("res://definitions/trade_card/trade_card_tres/" + file)
			trade_cards[card.id] = card
	
	
## 静态游戏数据-获取-贸易板块卡牌
func get_trade_card(id: StringName) -> TradeCardDefinition:
	if !trade_cards.has(id):
		push_error("trade_cards not found: %s" % id)
		return null
	return trade_cards[id]

## 静态游戏数据-整理-全部静态数据
func sort_dictionary():
	for city: CityDefinition in cities.values():
		# 整理区域数据
		for area: AreaDefinition in city.owned_area:
			area.city_id = city.id
			var can_industry_list_ids: Array[StringName] = []
			for industry in area.can_industry_list:
				can_industry_list_ids.append(industry.id)
			area.can_industry_list_ids = can_industry_list_ids
			area.can_industry_list.clear()
			city.owned_area_ids.append(area.id)
		city.owned_area.clear()

		# 整理道路数据
		for link: LinkDefinition in city.owned_link:
			link.linked_city_ids.append(city.id)
			city.owned_link_ids.append(link.id)
		city.owned_link.clear()

		# 整理市场数据
		if city.market_info != null:
			city.market_info_id = city.market_info.id
			city.market_info = null

	return
