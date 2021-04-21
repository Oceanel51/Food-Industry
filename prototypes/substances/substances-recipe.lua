require "prototypes.tables.fi-foods-table"
local foods = collect_all_foods_table()

-- each food have
--  1		  2						  3		  4			  5			  6		  7		  8		  9
--name,		type,					energy,	drinks,	{V,M,C,F},		fullness, c_f,	health,	effect/s
--@"corn",	"vegan-substances1",	3,		-2,		{0,1.6,0,0.5},	24,		24,		-1,		{}
-- where:
--@ energy / 3 = substances dust
--@ drinks / 12 = substances dust
--@ every balance V,M,C,F gives its value of substance
--@ other raw-straw

for index, food in pairs(foods) do
	----------------------- stage 1 of nutrient extraction - only growth items -----------------------
	-- 20% of one max substance is extracted substance, remaining 80% is substances-dust
	-- also 20% of Energy/3 and Drinks/12 is substances-dust, remaining 80% is raw-straw/raw-mince
	local substances1_max_name = ""
	local substances2_max_name = ""
	local substances1_order = 0
	local substances2_order = 0
	local substances1_max_val = 0
	local substances2_max_val = 0
	local substancesdust1_val = 0
	local rawstraw1_name = "raw-straw"
	local rawstraw1_val = 0
	local substances_results = {}
	
	if string.match(food[2], "meat") == "meat" or string.match(food[2], "fish") == "fish" then
		rawstraw1_name = "raw-mince"
	end

	substances1_max_val = math.max(food[5][1],food[5][2],food[5][3],food[5][4])
	if food[3] > food[4] and string.match(food[2], "substances1") == "substances1" then -- extract stage 1 - make dust

		if substances1_max_val == food[5][1] then
			substances1_max_name = "v"
			substances1_order = 1
			substances2_max_val = math.max(food[5][2],food[5][3],food[5][4])
		elseif substances1_max_val == food[5][2] then
			substances1_max_name = "m"
			substances1_order = 2
			substances2_max_val = math.max(food[5][1],food[5][3],food[5][4])
		elseif substances1_max_val == food[5][3] then
			substances1_max_name = "c"
			substances1_order = 3
			substances2_max_val = math.max(food[5][1],food[5][2],food[5][4])
		elseif substances1_max_val == food[5][4] then
			substances1_max_name = "f"
			substances1_order = 4
			substances2_max_val = math.max(food[5][1],food[5][2],food[5][3])
		end

		substancesdust1_val = (food[3] / 3 + food[4] / 12) * 0.2 + substances1_max_val * 0.8
		rawstraw1_val = math.abs((food[3] / 3 + food[4] / 12) * 0.8)

		if substances1_max_val * 0.2 == math.floor(substances1_max_val * 0.2) then -- integer
			substances_results = 
			{
				{type = "item", name = "substance-"..substances1_max_name, amount = substances1_max_val * 0.2},
			}
		else --- double
			if substances1_max_val * 0.2 < 1 then
				substances_results = 
				{
					{type = "item", name = "substance-"..substances1_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances1_max_val * 0.2)) % 1},
				}
			else
				substances_results = 
				{
					{type = "item", name = "substance-"..substances1_max_name, amount = math.floor(substances1_max_val * 0.2)},
					{type = "item", name = "substance-"..substances1_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances1_max_val * 0.2)) % 1},
				}
			end
		end
		if substancesdust1_val == math.floor(substancesdust1_val) then -- integer
			table.insert(substances_results, {type = "item", name = "substances-dust", amount = substancesdust1_val})
		else --- double
			if substancesdust1_val < 1 then
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = 1, probability = substancesdust1_val})
			else
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = math.floor(substancesdust1_val)})
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = 1, probability = tonumber(string.format("%.1f", substancesdust1_val)) % 1})
			end
		end
		if rawstraw1_val == math.floor(rawstraw1_val) then -- integer
			table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = rawstraw1_val})
		else --- double
			if rawstraw1_val < 1 then
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = 1, probability = rawstraw1_val})
			else
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = math.floor(rawstraw1_val)})
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = 1, probability = tonumber(string.format("%.1f", rawstraw1_val)) % 1})
			end
		end

		data:extend({
		{
			type = "recipe",
			-- food-to-substances1
			name = food[1].."-to-substances-1",
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/substances/food-to-substances1-"..substances1_max_name..".png",
			icon_size = 32,
			category = "cooking",
			subgroup = "foods-substances1",
			order = "w-s1-"..substances1_order,
			energy_required = food[6],
			ingredients = {
				{ food[1], 1 }
			},
			results = substances_results,
			--main_product = "substance-"..substances1_max_name,
			-- TODO с общего меню крафта их скрыть, только с машин
			allow_as_intermediate = false,
			allow_intermediate = false,
		},
		
		})
		
		-- add recipe to technology "nutrient-extraction"
		table.insert(data.raw.technology["nutrient-extraction"].effects,{recipe = food[1].."-to-substances-1", type = "unlock-recipe"})
		
	end
	-- TODO liquid extraction from food
	-- elseif food[4] < food[3] then -- liquid
	-- result = {type = "fluid", name = "compost-water", amount = ingredient[2]*10}


	----------------------- stage 2 of nutrient extraction = 60% of two max substances, remaining 40% is substances-dust -----------------------
	-- growth items and simple cooked food
	-- 60% of two max substances is extracted substances, remaining 40% is substances-dust
	-- also 60% of Energy/3 and Drinks/12 is substances-dust, remaining 40% is raw-straw/raw-mince
	
	if food[3] > food[4] and (string.match(food[2], "substances1") == "substances1" or string.match(food[2], "substances2") == "substances2") then -- extract stage 2 - make dust
		
		if substances1_max_val == food[5][1] then
			substances1_max_name = "v"
			substances1_order = 1
			substances2_max_val = math.max(food[5][2],food[5][3],food[5][4])
		elseif substances1_max_val == food[5][2] then
			substances1_max_name = "m"
			substances1_order = 2
			substances2_max_val = math.max(food[5][1],food[5][3],food[5][4])
		elseif substances1_max_val == food[5][3] then
			substances1_max_name = "c"
			substances1_order = 3
			substances2_max_val = math.max(food[5][1],food[5][2],food[5][4])
		elseif substances1_max_val == food[5][4] then
			substances1_max_name = "f"
			substances1_order = 4
			substances2_max_val = math.max(food[5][1],food[5][2],food[5][3])
		end

		if substances2_max_val == food[5][1] then
			substances2_max_name = "v"
			substances2_order = 1
		elseif substances2_max_val == food[5][2] then
			substances2_max_name = "m"
			substances2_order = 2
		elseif substances2_max_val == food[5][3] then
			substances2_max_name = "c"
			substances2_order = 3
		elseif substances2_max_val == food[5][4] then
			substances2_max_name = "f"
			substances2_order = 4
		end

		substancesdust1_val = (food[3] / 3 + food[4] / 12) * 0.6 + substances1_max_val * 0.4
		substancesdust1_val = substancesdust1_val + ((food[3] / 3 + food[4] / 12) * 0.6 + substances2_max_val * 0.4)
		rawstraw1_val = (food[3] / 3 + food[4] / 12) * 0.4

		-------------------------------------------------------------------
		if substances1_max_val * 0.6 == math.floor(substances1_max_val * 0.6) then -- integer
			substances_results = 
			{
				{type = "item", name = "substance-"..substances1_max_name, amount = substances1_max_val * 0.6},
			}
		else --- double
			if substances1_max_val * 0.6 < 1 then
				substances_results = 
				{
					{type = "item", name = "substance-"..substances1_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances1_max_val * 0.6)) % 1},
				}
			else
				substances_results = 
				{
					{type = "item", name = "substance-"..substances1_max_name, amount = math.floor(substances1_max_val * 0.6)},
					{type = "item", name = "substance-"..substances1_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances1_max_val * 0.6)) % 1},
				}
			end
		end

		if substances2_max_val * 0.6 == math.floor(substances2_max_val * 0.6) then -- integer
			table.insert(substances_results, {type = "item", name = "substance-"..substances2_max_name, amount = substances2_max_val * 0.6})
		else --- double
			if substances2_max_val * 0.6 < 1 then
				table.insert(substances_results, {type = "item", name = "substance-"..substances2_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances2_max_val * 0.6)) % 1})
			else
				table.insert(substances_results, {type = "item", name = "substance-"..substances2_max_name, amount = math.floor(substances2_max_val * 0.6)})
				table.insert(substances_results, {type = "item", name = "substance-"..substances2_max_name, amount = 1, probability = tonumber(string.format("%.1f", substances2_max_val * 0.6)) % 1})
			end
		end
		--log(food[1].."-to-substances-2")
		--log(serpent.block(substances_results))

		-------------------------------------------------------------------
		if substancesdust1_val == math.floor(substancesdust1_val) then -- integer
			table.insert(substances_results, {type = "item", name = "substances-dust", amount = substancesdust1_val})
		else --- double
			if substancesdust1_val < 1 then
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = 1, probability = substancesdust1_val})
			else
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = math.floor(substancesdust1_val)})
				table.insert(substances_results, {type = "item", name = "substances-dust", amount = 1, probability = tonumber(string.format("%.1f", substancesdust1_val)) % 1})
			end
		end

		if rawstraw1_val == math.floor(rawstraw1_val) then -- integer
			table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = rawstraw1_val})
		else --- double
			if rawstraw1_val < 1 then
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = 1, probability = rawstraw1_val})
			else
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = math.floor(rawstraw1_val)})
				table.insert(substances_results, {type = "item", name = rawstraw1_name, amount = 1, probability = tonumber(string.format("%.1f", rawstraw1_val)) % 1})
			end
		end
		-------------------------------------------------------------------

		-- TODO make recipes of substances stage 2
		data:extend({
		{
			type = "recipe",
			-- food-to-substances2
			name = food[1].."-to-substances-2",
			enabled = false,
			-- sprite name example: "food-to-substances-cf"
			icon = "__FoodIndustry__/graphics/icons/substances/food-to-substances2-"..substances1_max_name..substances2_max_name..".png",
			icon_size = 32,
			category = "cooking",
			subgroup = "foods-substances2",
			order = "w-s1-"..substances1_order..substances2_order,
			energy_required = food[6],
			ingredients = {
				{ food[1], 1 }
			},
			results = substances_results,
			-- TODO с общего меню крафта их скрыть, только с машин
			allow_as_intermediate = false,
			allow_intermediate = false,
		},
		
		})

		-- add recipe to technology "nutrient-extraction"
		table.insert(data.raw.technology["nutrient-extraction-2"].effects,{recipe = food[1].."-to-substances-2", type = "unlock-recipe"})
	end

	----------------------- stage 3 of nutrient extraction = 100% of all substances (with positive values) -----------------------
	-- all variations (?) of food
	-- 100% of all substances is extracted substances
	-- also 100% of Energy/3 and Drinks/6 is substances-dust
	
	-- TODO make recipes of substances stage 3

end


