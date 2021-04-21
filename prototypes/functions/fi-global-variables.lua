require "prototypes.tables.fi-foods-table"


local foods = foods_table()

-- initialize global variables
function fi_global_variables_init()
	if not global.energy_max then
		global.energy_max = {}           -- values of maximum Energy
	end
	if not global.energy then
		global.energy = {}               -- values of current Energy
	end
	if not global.drinks_max then
		global.drinks_max = {}           -- values of current maximum Drinks (new!)
	end
	if not global.drinks then
		global.drinks = {}               -- values of current Drinking energy (new!)
	end
	if not global.foods_eaten then
		global.foods_eaten = {}          -- values of current foods eaten (new!)
	end
	if not global.fullness_stomach then
		global.fullness_stomach = {}     -- values of current Stomach Fullness values of overgrazing food
	end
	if not global.fullness then
		global.fullness = {}             -- values of current Fullness
	end
	if not global.update_delay then
		global.update_delay = {}         -- values of technology energy reduce modifier
	end
	if not global.used then
		global.used = {}                 -- values of ...?
	end
	if not global.drinks_used then
		global.drinks_used = {}          -- values of ...?
	end
	if not global.usage then
		global.usage = {}                -- values of current usage from control.lua, depends of player activity
	end
	if not global.foods then
		global.foods = {}                -- values of food table for Player Character
	end
	if not global.effects then
		global.effects_active = {}       -- values of active effects
		global.effects = {}              -- values of effects modifiers
	end
	
	if not global.substances then
		global.substances = {}           -- values of {V,M,C,F} substances (new!)
	end


	--------------- mod only modifiers ---------------
	if not global.fi_energy_ussage_modifier then
		global.fi_energy_ussage_modifier = {}                 -- values of energy ussage modifier
	end
	if not global.fi_drinks_ussage_modifier then
		global.fi_drinks_ussage_modifier = {}                 -- values of drinks ussage modifier
	end
	if not global.fi_character_sleep_modifier then
		global.fi_character_sleep_modifier = {}               -- values of sleep
	end
	--if not global.fi_character_digestion_modifier then
	--	global.fi_character_digestion_modifier = {}           -- values of digestion modifier
	--end
	if not global.fi_character_fat_modifier then
		global.fi_character_fat_modifier = {}                 -- values of fat modifier
	end
	if not global.fi_achievements then
		global.fi_achievements = {}                           -- variable for achievements
	end
	--------------------------------------------------
	if not global.fi_debug then
		global.fi_debug = {}
	end

	------------------- foodi vars -------------------
--	if global ~= nil then
	if not global.foodi then global.foodi = {} end
	if not global.players then global.players = {} end
	if not global.foodi.players then global.foodi.players = {} end
	--if not global.foodi.fruittrees then global.foodi.fruittrees = {} end
	if not global.foodi.fruitSeedlings then global.foodi.fruitSeedlings = {} end	-- tree seedlings
	if not global.foodi.tilefertility then global.foodi.tilefertility = {} end		-- tile fertility
	if not global.foodi.event_entity_filter then global.foodi.event_entity_filter = {} end		-- event entity filter
--	end

end


-- set global variables default data of connected players
function fi_global_variables_set(index)
	
	if not global.energy_max[index] then
		global.energy_max[index] = 100 -- set initial max Energy of connected player
	end
	if not global.energy[index] then
		global.energy[index] = global.energy_max[index] -- set initial Energy of connected player
	end
	if not global.drinks_max[index] then
		global.drinks_max[index] = 100 -- values of current maximum Drinks of connected player (new!)
	end
	if not global.drinks[index] then
		global.drinks[index] = 0 -- values of current Drinking energy of connected player (new!)
	end
	if not global.foods_eaten[index] then
		--							foods,	eaten Energy,	drinks,	drunk fluids,	used substances,	types of used food
		global.foods_eaten[index] =	{0,		0,				0,		0,				{v=0,m=0,c=0,f=0},	{}} -- values of current Foods Eaten of connected player (new!)
	end
	if not global.fullness_stomach[index] then
		--                                                                                                     1          2        3       4        5         6            7             8
		global.fullness_stomach[index] = {} -- table for Stomach Fullnesses of connected player, where is {food_name, food_type, energy, water, {V,M,C,F}, fullness, fullness_digest, health,},
	end
	if not global.fullness[index] then
		global.fullness[index] = 0 -- values of current Fullness values of overgrazing food
	end
	-- TODO remake for achievements
	if not global.foods[index] then
		global.foods[index] = {}
		for i,f in pairs(foods) do
			global.foods[index][i] = 0
		end
	end
	--if not global.overweight_full_time[index] then
	--	global.overweight_full_time[index] = 0
	--end
	if not global.update_delay[index] then
		global.update_delay[index] = 1 -- values of technology for Energy reduce modifier [1 ... unlim]
	end
	if not global.used[index] then
		global.used[index] = 0
	end
	if not global.drinks_used[index] then
		global.drinks_used[index] = 0
	end
	if not global.usage[index] then
		global.usage[index] = 1
	end
	if not global.effects[index] then
		global.effects_active[index] = {} -- values of current active effects from food {affecting item or event, effect_name, modifier, action time}
		global.effects[index] = {} -- values of current active effects modifiers
		--						key									enabled,	modifier,	time/stage/level,	delay,	influencing factors (table)
		global.effects[index]["drinks_for_energy_usage"]		 = {false,		0,			0,					0,		{{"drinks_is_0",0,0},}}		-- init basic value of modifier when +Drinks affect for Energy usage
		global.effects[index]["substances_for_energy_usage"]	 = {false,		0,			0,					0,		{{"vmcf_is_0",0,0},}}		-- init basic value of modifier when +VMCF Substances affect for Energy usage
		
		--															enabled,	-,			time,				-,		influencing factors (table)
		global.effects[index]["drink_to_add_more_energy"]		 = {false,		0,			0,					0,		{}}							-- init empty value of modifier when Pllayer drink after use item
		global.effects[index]["add_more_energy"]				 = {false,		0,			0,					0,		{}}							-- init empty value of More Energy
		global.effects[index]["add_more_drinks"]				 = {false,		0,			0,					0,		{}}							-- init empty value of More Drinks
		global.effects[index]["energy_usage"]					 = {false,		0,			0,					0,		{}}							-- init empty value of Energy usage
		global.effects[index]["drinks_usage"]					 = {false,		0,			0,					0,		{}}							-- init empty value of Drinks usage
		
		global.effects[index]["digestion"]						 = {false,		0,			0,					0,		{}}							-- init empty value of Digestions
		--															enabled,	stage,		time to next,		-,		influencing factors (table)
		global.effects[index]["thirst"]							 = {false,		0,			14400,				0,		{}}							-- init basic value of Thirst
		
		--															enabled,	-,			time left,			value
		global.effects[index]["overeating"]						 = {false,		0,			0,					0		}							-- init empty value of Overeating
		--															enabled,	modifier,	active time,		value
		global.effects[index]["fat"]							 = {false,		1,			0,					-78		}							-- init empty value of Fat
		--															enabled,	modifier,	time to next,		stage,	influencing factors (table)
		global.effects[index]["sleep"]							 = {false,		1,			14400,				0,		{}}							-- init basic values of Sleep state
		
		--															enabled,				time,				delay,	influencing factors (table)
		global.effects[index]["speed"]							 = {false,		0,			0,					0,		{}}							-- init empty value of runing Speed
		global.effects[index]["mining"]							 = {false,		0,			0,					0,		{}}							-- init empty value of Mining speed
		global.effects[index]["crafting"]						 = {false,		0,			0,					0,		{}}							-- init empty value of Crafting speed
		global.effects[index]["long_reach"]						 = {false,		0,			0,					0,		{}}							-- init empty value of Long reach distance
		
		global.effects[index]["health_buffer"]					 = {false,		0,			0,					0,		{}}							-- init empty value of Health Buffer effect
		global.effects[index]["regeneration"]					 = {false,		0,			0,					0,		{}}							-- init empty value of Regeneration effect
		global.effects[index]["invulnerability"]				 = {false,		0,			0,					0,		{}}							-- init empty value of Invulnerability effect
		
		global.effects[index]["neutralize_active_effects"]		 = {false,		0,			0,					0,		{}}							-- init empty value of Neutralize effect 1 level
	end
	if not global.substances[index] then
		global.substances[index] = {v=0,m=0,c=0,f=0} -- values of substances {V,M,C,F} of connected player (new!)
	end
	
	--------------- vanilla modifiers -----------------
	--@ vanilla modifiers adds or remove directrly in functions:
	--@  effects_add_update(...)
	--@  effects_add_insert(...)
	--@  effects_remove(...)

	--------------- mod only modifiers ---------------
	-- эти модификаторы уже используются в коде и мы их в effects_add(...) и effects_remove(...) модифицируем сразу - плюсуем или отнимаем
	if not global.fi_energy_ussage_modifier[index] then
		global.fi_energy_ussage_modifier[index] = 0                 -- values of energy ussage modifier [-unlim ... 0.0 ... 1] limited in code to +0.99
	end
	if not global.fi_drinks_ussage_modifier[index] then
		global.fi_drinks_ussage_modifier[index] = 0                 -- values of drinks ussage modifier [-unlim ... 0.0 ... 1]
	end
	--if not global.fi_character_sleep_modifier[index] then
	--	global.fi_character_sleep_modifier[index] = 1               -- values of sleep [0%-100%]
	--end
	--if not global.fi_character_digestion_modifier[index] then
	--	global.fi_character_digestion_modifier[index] = 0           -- values of digestion modifier [-unlim ... 0.0 ... 1]
	--end
	if not global.fi_character_fat_modifier[index] then
		global.fi_character_fat_modifier[index] = 0                 -- values of fat modifier [normal state is 0]
	end
	
	if not global.fi_achievements[index] then
		global.fi_achievements[index] = {}                           -- variable for achievements
		--								key					unlock,		count/stage,		timeall,	table
		-- TODO implement achievements
		global.fi_achievements[index]["gourmet"]			 = {false,		0,				0,			{}		}
		global.fi_achievements[index]["overweight"]			 = {false,		0,				0,			{}		} -- values achievement "overweight"
		global.fi_achievements[index]["trees-gardener"]		 = {false,		0,				0,			nil		} -- init empty value of trees-gardener
	end
	--------------------------------------------------
	if not global.fi_debug[index] then
		global.fi_debug[index] = {0,100,0,0,0,0}
	end

end
