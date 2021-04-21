-- functions of calculate usages
require "libs.helper-functions"


-- function adds used food table line to all fullnesses
--@ also for adds fictive food: "drink-to-add-more-energy"
function eat_food(player, index, food, food_item)
	
	----------------------- append new used food to all fullnesses
	if global.fullness then
		if global.fullness_stomach[index] and type(global.fullness_stomach[index]) == 'table' then
			-- append food fullness to global.fullness
			global.fullness[index] = global.fullness[index] + food[6]
			-- check and overwrite overeating
			if global.fullness[index] > 101 and global.fullness[index] > global.effects[index]["overeating"][4] then
				global.effects[index]["overeating"][4] = global.fullness[index] - 100 -- set new overeating value
				global.effects[index]["overeating"][3] = (global.fullness[index] - 100) * 10800 / 80 -- set overeating time if 80% decrease along 3 min = 10800 ticks
			end

			--local new_food = table.deepcopy(food)
			table.insert(global.fullness_stomach[index], food)

			-- TODO тут будет инфо о съеденой пище если есть "Eating" button или food-feeder equipment
			
		else
			player.print("[Debug] [color=1,0,0]Warning[/color]: "..food[1].." is not a table!")
		end
	end
	-----------------------

	-- store eaten food
	global.foods_eaten[index][1] = global.foods_eaten[index][1] + 1
	global.foods_eaten[index][2] = global.foods_eaten[index][2] + food[3]
	--global.foods_eaten[index][3] = global.foods_eaten[index][3] + 1
	global.foods_eaten[index][4] = global.foods_eaten[index][4] + food[4]
	--writeDebug(serpent.block(global.foods_eaten[index][5]))
	--writeDebug(serpent.block(food[5]))
	global.foods_eaten[index][5]["v"] = global.foods_eaten[index][5]["v"] + food[5][1]
	global.foods_eaten[index][5]["m"] = global.foods_eaten[index][5]["m"] + food[5][2]
	global.foods_eaten[index][5]["c"] = global.foods_eaten[index][5]["c"] + food[5][3]
	global.foods_eaten[index][5]["f"] = global.foods_eaten[index][5]["f"] + food[5][4]
	table.insert(global.foods_eaten[index][6], food[2])

end


-- Fullness calculation
--@ it's like a stomach in the human body, You put the food and its digestion takes place in turns.
--@     1          2         3       4       5         6            7             8
--@ {food_name, food_type, energy, water, {V,M,C,F}, fullness, fullness_digest, health,}
function fullness_calc_on_tick(index)

    if not global.fullness[index] then
        return
    end

    if table.maxn(global.fullness_stomach[index]) > 0 then
        --writeDebug("fullness_stomach[index]) > 0")
        
        --game.players[index].print(dump(global.fullness_stomach[index]))
        for i,food in pairs(global.fullness_stomach[index]) do
            --writeDebug(dump(food))
            --game.players[index].print(dump(food))
            if food[7] > 0 then
                -- назначаем стандартную скорость расхода Fullness
                local fullness_diff = (settings.global["food-industry-hunger-speed"].value * (global.effects[index]["digestion"][2]+1) / 400 / 4)
                
                -- перевариваем еду - добавляем каждой еде в желудке степень переваривания в column 7
                -- Fullness subtraction
                global.fullness[index] = global.fullness[index] - fullness_diff
                -- TODO доделать fullness_calc
                global.fullness_stomach[index][i][7] = global.fullness_stomach[index][i][7] - fullness_diff
                --writeDebug("global.fullness["..index.."] - "..global.fullness[index])
                
                -- Energy subtraction and summation
                -- add excess of Energy to fat_modifier
                if global.energy[index] + ( food[3] - ( food[3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > global.energy_max[index] then
                    global.energy[index] = global.energy_max[index]
                    -- добавляем излишки Energy к fat только уменьшив в 6 раз
                    global.effects[index]["fat"][4] = global.effects[index]["fat"][4] + ( food[3] - ( food[3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) / 6
                else
                -- добавляем к global Energy разницу в процентах от единицы Fullness
                -- if Energy is 3 and Fullness is 8 then Energy=Energy+(3-(3*100/8)*(8-1)/100)
                    global.energy[index] = global.energy[index] + ( food[3] - ( food[3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end

                -- Water subtraction and summation
                if global.drinks[index] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > global.drinks_max[index] then
                    global.drinks[index] = global.drinks_max[index]
                	-- add excess of Drinks/20 to fat_modifier
                    global.effects[index]["fat"][4] = global.effects[index]["fat"][4] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) / 20
				elseif global.drinks[index] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) < 0 then
                    -- TODO excess -Drinks affect to Thirst x2
					if ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > 0 then
						-- when thirst add drinks*2
						global.drinks[index] = global.drinks[index] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) * 2
						-- append time when thirst with 800x values drinks
						global.effects[index]["thirst"][3] = global.effects[index]["thirst"][3] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) * 800
					else
						-- when thirst remove drinks/2
						global.drinks[index] = global.drinks[index] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) / 2
						-- reduce time when thirst with 200x values drinks
						global.effects[index]["thirst"][3] = global.effects[index]["thirst"][3] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) * 200
					end
                else
					global.drinks[index] = global.drinks[index] + ( food[4] - ( food[4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end

                -- Substances subtraction and summation or destroy excess of Substances
                if global.substances[index]["v"] + ( food[5][1] - ( food[5][1] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > 100 then
                    global.substances[index]["v"] = 100
				elseif global.substances[index]["v"] + ( food[5][1] - ( food[5][1] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) <= -10 then
                    global.substances[index]["v"] = -10
                else
                    global.substances[index]["v"] = global.substances[index]["v"] + ( food[5][1] - ( food[5][1] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end
                if global.substances[index]["m"] + ( food[5][2] - ( food[5][2] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > 100 then
                    global.substances[index]["m"] = 100
				elseif global.substances[index]["m"] + ( food[5][2] - ( food[5][2] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) <= -10 then
                    global.substances[index]["m"] = -10
                else
                    global.substances[index]["m"] = global.substances[index]["m"] + ( food[5][2] - ( food[5][2] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end
                if global.substances[index]["c"] + ( food[5][3] - ( food[5][3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > 100 then
                    global.substances[index]["c"] = 100
				elseif global.substances[index]["c"] + ( food[5][3] - ( food[5][3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) <= -10 then
                    global.substances[index]["c"] = -10
                else
                    global.substances[index]["c"] = global.substances[index]["c"] + ( food[5][3] - ( food[5][3] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end
                if global.substances[index]["f"] + ( food[5][4] - ( food[5][4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) > 100 then
                    global.substances[index]["f"] = 100
				elseif global.substances[index]["f"] + ( food[5][4] - ( food[5][4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 ) <= -10 then
                    global.substances[index]["f"] = -10
                else
                    global.substances[index]["f"] = global.substances[index]["f"] + ( food[5][4] - ( food[5][4] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                end

                -- Health subtraction and summation
                if (game.players[index].character) then
                    game.players[index].character.health = game.players[index].character.health + ( food[8] - ( food[8] * 100 / food[6] ) * ( food[6] - fullness_diff ) / 100 )
                    if game.players[index].character.health <= 0 then
                        game.players[index].character.health = 1
                        game.players[index].character.damage(900000,"neutral")
                        return
                    end
                end
            else
                -- remove depleted food
                table.remove(global.fullness_stomach[index], i)

                --writeDebug("global.fullness_stomach["..index.."] remove from table")
                --writeDebug(dump(global.fullness_stomach[index]))
            end
        end
    else
        global.fullness[index] = 0
        --writeDebug("fullness_stomach["..index.."]) = "..global.fullness[index].." !!!")
    end
	
end


function energy_reduction(index, player)
	local settings_delay = 10000 / settings.global["food-industry-hunger-speed"].value -- default 10000 / 100 = 100%
	local default_factor = 0.1 -- 0.1 is reduce additionaly for 10% (it is needed for a global change in Energy usage)
    
    global.used[index] = global.used[index] + global.usage[index]
	--writeDebug("global.used["..index.."] "..global.used[index])

    --								100%	*		1					-				0							+	(reduce of default_factor)
    if global.used[index] >= (settings_delay * (global.update_delay[index] - global.fi_energy_ussage_modifier[index] + default_factor)) then
        global.used[index] = global.used[index] - (settings_delay * (global.update_delay[index] - global.fi_energy_ussage_modifier[index] + default_factor))
        if global.energy[index] > -50 then
            global.energy[index] = global.energy[index] - 1
            --writeDebug("global.energy["..index.."] "..global.energy[index])
            --writeDebug("global.fi_energy_ussage_modifier["..index.."] "..global.fi_energy_ussage_modifier[index])
        end
    end

end


-- Drinks usage
function drinks_reduction(index, player)
	local settings_delay = 10000 / settings.global["food-industry-hunger-speed"].value -- default 10000 / 100 = 100%
	
	global.drinks_used[index] = global.drinks_used[index] + global.usage[index]
	
	-- drinks ussage в отличии от energy usage не зависит от global.update_delay, который исследуется с помощью technology
	-- depends only from global.usage
	if global.drinks_used[index] >= (settings_delay * (1 - global.fi_drinks_ussage_modifier[index])) then
		global.drinks_used[index] = global.drinks_used[index] - (settings_delay * (1 - global.fi_drinks_ussage_modifier[index]))
		if global.drinks[index] <= 0 then
			if global.effects[index]["thirst"][1] and global.effects[index]["thirst"][2] == 1 then -- if thirst preparation (6 min)
				global.drinks[index] = global.drinks[index] - 0.55
			elseif global.effects[index]["thirst"][1] and global.effects[index]["thirst"][2] == 2 then -- if thirst active (30 min)
				if math.ceil(math.abs(global.effects[index]["thirst"][3])/108000*100) >= 40 then
					global.drinks[index] = global.drinks[index] - 1.25
				elseif math.ceil(math.abs(global.effects[index]["thirst"][3])/108000*100) >= 20 then
					global.drinks[index] = global.drinks[index] - 1.0
				else
					global.drinks[index] = global.drinks[index] - 0.75
				end
			else -- before thirst preparation (4 min)
				global.drinks[index] = global.drinks[index] - 0.1
			end
			-- drinks could not be lower then -drinks_max
			if global.drinks[index] < global.drinks_max[index] * -1 then
				global.drinks[index] = global.drinks_max[index] * -1
			end
		else
			if global.drinks[index] > global.drinks_max[index] * -1 then
				global.drinks[index] = global.drinks[index] - 0.9 -- normal drinks usage
				if global.drinks[index] < 0 then
					global.drinks[index] = 0
				end
			end
		end
	end

end


-- Substances usage
function substances_reduction(index)
	-- append 1% of Energy if vmcf > 1
	if global.substances[index]["v"] > 1 and global.substances[index]["m"] > 1 and global.substances[index]["c"] > 1 and global.substances[index]["f"] > 1 then
		global.energy[index] = global.energy[index] + global.energy_max[index] / 100 * 1
	end

	-- maintain levels not lower than -10
	-- and if levels lower than -10 - restore to 0
	if global.substances[index]["v"] - 1 >= 1 then
		global.substances[index]["v"] = global.substances[index]["v"] - 1
	elseif global.substances[index]["v"] - 1 <= -1.01 then
		global.substances[index]["v"] = global.substances[index]["v"] + 1
	elseif global.substances[index]["v"] - 1 <= -10 then
		global.substances[index]["v"] = -10
	else
		global.substances[index]["v"] = 0
	end
	
	if global.substances[index]["m"] - 1 >= 1 then
		global.substances[index]["m"] = global.substances[index]["m"] - 1
	elseif global.substances[index]["m"] - 1 <= -1.01 then
		global.substances[index]["m"] = global.substances[index]["m"] + 1
	elseif global.substances[index]["m"] - 1 <= -10 then
		global.substances[index]["m"] = -10
	else
		global.substances[index]["m"] = 0
	end
	-- add_more_drinks +0.2% when vm_above_5%
	if global.substances[index]["v"] > 5 and global.substances[index]["m"] > 5 then
		global.drinks[index] = global.drinks[index] + global.drinks_max[index] / 100 * 0.17
	end

	if global.substances[index]["c"] - 1 >= 1 then
		global.substances[index]["c"] = global.substances[index]["c"] - 1
	elseif global.substances[index]["c"] - 1 <= -1.01 then
		global.substances[index]["c"] = global.substances[index]["c"] + 1
	elseif global.substances[index]["c"] - 1 <= -10 then
		global.substances[index]["c"] = -10
	else
		global.substances[index]["c"] = 0
	end

	if global.substances[index]["f"] - 0.8 >= 0.8 then
		global.substances[index]["f"] = global.substances[index]["f"] - 0.8
	elseif global.substances[index]["f"] - 1 <= -1.01 then
		global.substances[index]["f"] = global.substances[index]["f"] + 1
	elseif global.substances[index]["f"] - 1 <= -10 then
		global.substances[index]["f"] = -10
	else
		global.substances[index]["f"] = 0
	end
end


function thirst_reduction(index,reduce_value)
	if global.drinks[index] <= 0 then
		global.effects[index]["thirst"][3] = global.effects[index]["thirst"][3] - reduce_value * global.usage[index] -- countdown to thirst
	elseif global.drinks[index] > 0 and global.effects[index]["thirst"][2] == 0 and global.effects[index]["thirst"][3] < 14400 then
		global.effects[index]["thirst"][3] = global.effects[index]["thirst"][3] + reduce_value -- restore thirst preparation timer
	end
end


function fat_reduction(index,reduce_value)
	if global.effects[index]["fat"][4] > 0 and global.effects[index]["overeating"][4] <= 0 then
		global.effects[index]["fat"][4] = global.effects[index]["fat"][4] - reduce_value
	-- when a "starve" fat can go down to -100
	elseif global.effects[index]["fat"][4] > -100 and global.energy[index] < global.energy_max[index] * 0.25 then
		global.effects[index]["fat"][4] = global.effects[index]["fat"][4] - reduce_value
	
	-- TODO доделать расход "fat"
	-- а так +fat стремится до 0

	-- increase fat when "overeating"
	elseif global.effects[index]["overeating"][4] > 0 then
		global.effects[index]["fat"][4] = global.effects[index]["fat"][4] + global.effects[index]["overeating"][4] / 100 * reduce_value
	end
end
function overeating_reduction(index,reduce_time)
	if global.effects[index]["overeating"][3] > 0 and global.effects[index]["overeating"][4] > 0 then
		if global.effects[index]["overeating"][3] - reduce_time > 0 then
			--writeDebug("to overeating "..global.effects[index]["overeating"][3].."-"..reduce_time)
			global.effects[index]["overeating"][3] = global.effects[index]["overeating"][3]
			global.effects[index]["overeating"][4] = (global.effects[index]["overeating"][3]) * 80 / 7200
			--writeDebug("overeating "..global.effects[index]["overeating"][3].." "..global.effects[index]["overeating"][4])
		else
			global.effects[index]["overeating"][3] = 0
			global.effects[index]["overeating"][4] = 0
		end
	else
		global.effects[index]["overeating"][3] = 0
		global.effects[index]["overeating"][4] = 0
	end
end


-- Effects assignment
-- add new effect data values
function effects_add(index, item_name, effect_data)
	--  where:
	--@ index = Player index
	--@ item_name = "simple-speed-capsule"
	--@ effect_data = {"crafting",1,12000}

	--  conception 1
	--@ global.effects[index]["speed"]	 = {false,	0,	0,	{
	--@ 														{"simple-speed-capsule",0.3,5400},
	--@ 														{"vmc_above_20",0.2,14400},
	--@ 													} }
	--@ global.effects[index]["digestion"]	 = {false,	0,	0,	{
	--@ 														{"vmcf_above_40",0.4,0},
	--@ 														{"simple-digestive-capsule",0.5,14400},
	--@ 													} }
	--@
	--@ OR
	--@
	--  conception 2
	--@ global.effects[index]["speed"]	 = {false,	0,	0,}
	--@ global.effects[index]["digestion"]	 = {false,	0,	0,}
	--@	global.effects_active[index] = {
	--@ 														{"simple-speed-capsule",0.3,5400},
	--@ 														{"vmc_above_20",0.2,0},
	--@ 														{"all_substances_above_40",0.4,0},
	--@ 														{"simple-digestive-capsule",0.5,14400},
	--@ 													}

	-- TODO effects_add function: от капсул и еды
	--@ когда добавляется эффект, то:
	--@ - данные эфекта добавляются в global.effects[index]["key"]	: 
	--@ - 															- имя-ключ от от какого элемента эффект
	--@ - 															- значение/модификатор эффекта
	--@ - 															- время действия эффекта
	--@ - затем время эффекта начинает отниматься в effects_time_reduction(index)
	--@ - 															- проверяется его время
	--@ - 															- если время вышло - эффект удаляется и го значение/модификатор отнимается с общей суммы в своей глобальной переменной
	--@ - а обрабатываться эфект effects_calc_on_tick(index, player):
	--@ - 															- тут проверяются эфекты зашитые в коде

	-- check "neutralizing" effects
	if effect_data[1] == "neutralize_active_effects" then
		neutralize_active_effects(index, item_name, effect_data)
		return
	end
	
	-- OPTIMIZE find effect key in a table
	if table.maxn(global.effects[index][effect_data[1]][5]) <= 0 then
		-- insert first new effect
		--writeDebug("No effects for '"..effect_data[1].."', insert new ")
		effects_add_insert(index, item_name, effect_data)
		return
	elseif table.maxn(global.effects[index][effect_data[1]][5]) > 0 then
		local founded = false
		for i5,e5 in pairs(global.effects[index][effect_data[1]][5]) do
			--writeDebug("i5="..i5..",")
			--writeDebug(dump(e5))
			--writeDebug("==")
			if e5[1] == item_name then -- update effect
				founded = true
				--writeDebug("update "..effect_data[1])
				effects_add_update(index, item_name, effect_data, i5)
			
			elseif string.match(e5[1], "%w+%-%w+$") and string.match(e5[1], "%w+%-%w+$") == string.match(item_name, "%w+%-%w+$") then -- update effect if capsule
				founded = true
				--writeDebug("update capsule "..effect_data[1])
				
				--writeDebug(index..", "..i5..", "..effect_data[1]..", "..e5[2])
				effects_remove(index, i5, effect_data[1], e5[2]) -- remove old data
				effects_add_insert(index, item_name, effect_data)
			end
		end
		if not founded then
			-- insert effect
			--writeDebug("insert "..effect_data[1])
			effects_add_insert(index, item_name, effect_data)
		end
	end

end


function effects_add_update(index, item_name, effect_data, i5)
	global.effects[index][effect_data[1]][1] = true
	if effect_data[3] ~= -100000 then
		global.effects[index][effect_data[1]][3] = global.effects[index][effect_data[1]][3] + effect_data[3]
	end
	global.effects[index][effect_data[1]][5][i5][2] = effect_data[2]
	global.effects[index][effect_data[1]][5][i5][3] = effect_data[3]
	-- TODO check with delay
	global.effects[index][effect_data[1]][4] = global.effects[index][effect_data[1]][4] + table.maxn(global.effects[index][effect_data[1]][5]) * 20
	
	--effects_vanilla_add_or_remove(true, index, effect_data[1], effect_data[2])
	--global.effects[index][effect_data[1]][2] = global.effects[index][effect_data[1]][2] + effect_data[2]
	global.effects[index][effect_data[1]][2] = effect_data[2]
end


function effects_add_insert(index, item_name, effect_data)
	--local new_table_line = {item_name, effect_data[2], effect_data[3]}
	global.effects[index][effect_data[1]][1] = true
	global.effects[index][effect_data[1]][2] = global.effects[index][effect_data[1]][2] + effect_data[2]
	if effect_data[3] ~= -100000 then
		global.effects[index][effect_data[1]][3] = global.effects[index][effect_data[1]][3] + effect_data[3]
	end
	--@ effect_data[4] may be = nil or table or number
	if effect_data[4] ~= nil and type(effect_data[4]) == "number" then
		global.effects[index][effect_data[1]][4] = effect_data[4]
		table.insert(global.effects[index][effect_data[1]][5], {item_name, effect_data[2], effect_data[3], effect_data[4]})
	elseif effect_data[4] ~= nil and type(effect_data[4]) == "table" then
		if effect_data[1] == "drink_to_add_more_energy" then
			for i,e in pairs(effect_data[4]) do
				--						in effect_key[5]				item,	energy * modifier	time of action
				global.effects[index][effect_data[1]][1] = true
				global.effects[index][effect_data[1]][3] = effect_data[3]
				table.insert(global.effects[index][effect_data[1]][5], {e[1], e[2]*effect_data[2], effect_data[3]})
			end
		else
			writeDebug("[A bug]: this fi type of effect is not be insert! Contact the developer.")
		end
	else
		table.insert(global.effects[index][effect_data[1]][5], {item_name, effect_data[2], effect_data[3]})
		effects_vanilla_add_or_remove(true, index, effect_data[1], effect_data[2])
	end

	-- add 1 effect count
	-- add 1 effect sprite
	figui.reserveUpdateEffectsGUI(index)
end


-- remove effect data when time is left
function effects_remove(index, effect_index, effect_name, effect_modifier)
	--writeDebug("effect removed - "..index..", "..effect_index..", "..effect_name..", "..effect_modifier)
	
	table.remove(global.effects[index][effect_name][5], effect_index)
	effects_vanilla_add_or_remove(false, index, effect_name, effect_modifier)
	
	-- set effect to false if empty affects table5
	if not next(global.effects[index][effect_name][5]) then
		effects_remove_last(index, effect_name)
	end

	-- remove 1 effect count
	figui.reserveUpdateEffectsGUI(index)
end
function effects_remove_last(index, effect_name)
	-- reset effects values to:
	--@ "speed", 
	if global.effects[index][effect_name][5][1] and effect_name == "speed" then
		global.effects[index][effect_name][5][1] = false
		global.effects[index][effect_name][5][2] = 0
		global.effects[index][effect_name][5][3] = 0
		global.effects[index][effect_name][5][4] = 0
		writeDebug("[Debug]: Data for effect: "..effect_name.." is reset.")
	elseif global.effects[index][effect_name][5][1] and effect_name == "regeneration" then
		global.effects[index][effect_name][5][1] = false
		global.effects[index][effect_name][5][2] = 0
		global.effects[index][effect_name][5][3] = 0
		global.effects[index][effect_name][5][4] = 0
		writeDebug("[Debug]: Data for effect: "..effect_name.." is reset.")
	end
end

function effects_vanilla_add_or_remove(add_bool, index, effect_name, effect_modifier)
	if effect_name == "speed" then
		if add_bool then
			game.players[index].character_running_speed_modifier = game.players[index].character_running_speed_modifier + effect_modifier
		else
			if game.players[index].character_running_speed_modifier - effect_modifier < -1 then
				game.players[index].character_running_speed_modifier = -1
			else
				game.players[index].character_running_speed_modifier = game.players[index].character_running_speed_modifier - effect_modifier
			end
		end
	elseif effect_name == "crafting" then
		if add_bool then
			game.players[index].character_crafting_speed_modifier = game.players[index].character_crafting_speed_modifier + effect_modifier
		else
			if game.players[index].character_crafting_speed_modifier - effect_modifier < -1 then
				game.players[index].character_crafting_speed_modifier = -1
			else
				game.players[index].character_crafting_speed_modifier = game.players[index].character_crafting_speed_modifier - effect_modifier
			end
		end
	elseif effect_name == "mining" then
		if add_bool then
			game.players[index].character_mining_speed_modifier = game.players[index].character_mining_speed_modifier + effect_modifier
		else
			if game.players[index].character_mining_speed_modifier - effect_modifier < -1 then
				game.players[index].character_mining_speed_modifier = -1
			else
				game.players[index].character_mining_speed_modifier = game.players[index].character_mining_speed_modifier - effect_modifier
			end
		end
	elseif effect_name == "long_reach" then
		if add_bool then
			--if character_build_distance_bonus = 100%
			game.players[index].character_build_distance_bonus = game.players[index].character_build_distance_bonus + effect_modifier					-- if this is 100%
			game.players[index].character_item_drop_distance_bonus = game.players[index].character_item_drop_distance_bonus + effect_modifier * 0.2		-- then this = 20%
			game.players[index].character_reach_distance_bonus = game.players[index].character_reach_distance_bonus + effect_modifier * 1.2				-- then this = 120%
		else
			game.players[index].character_build_distance_bonus = game.players[index].character_build_distance_bonus - effect_modifier					-- if this is 100%
			game.players[index].character_item_drop_distance_bonus = game.players[index].character_item_drop_distance_bonus - effect_modifier * 0.2		-- then this = 20%
			game.players[index].character_reach_distance_bonus = game.players[index].character_reach_distance_bonus - effect_modifier * 1.2				-- then this = 120%
		end
	elseif effect_name == "health_buffer" or effect_name == "invulnerability"  then
		if add_bool then
			game.players[index].character_health_bonus = game.players[index].character_health_bonus + effect_modifier
		else
			if game.players[index].character_health_bonus - effect_modifier then
				game.players[index].character_health_bonus = 0
			else
				game.players[index].character_health_bonus = game.players[index].character_health_bonus - effect_modifier
			end
		end
	end
end


-- reduce effects time values
function effects_time_reduction(index) -- after -60 ticks

	for i,effect in pairs(global.effects[index]) do
		--writeDebug(i)
		--writeDebug(dump(effect[5]))
		if i ~= "fat" and i ~= "thirst" and i ~= "sleep" and i ~= "drinks_for_energy_usage" and i ~= "substances_for_energy_usage" then
			if global.effects[index][i][3] - 60 > 0 then
				global.effects[index][i][3] = global.effects[index][i][3] - 60
			end
			--writeDebug(global.effects[index][i][3])
			if effect[5] ~= nil then
				for i5,e5 in pairs(effect[5]) do
					if type(e5[3]) ~= 'boolean' and e5[3] > 0 and e5[3] - 60 > 0 then
						e5[3] = e5[3] - 60
					elseif e5[3] <= -100000 then
					-- TODO skip effect
					else
						e5[3] = 0
						--writeDebug("effect to remove: "..e5[1])
						effects_remove(index, i5, i, e5[2])
					end
				end
			end
		end
		
	end
end

function to_array(effect_table)
	local effect_array = {}
	local i = 1
	for _,v in pairs(effect_table) do
		effect_array[i] = v
		i = i + 1
	end
	return effect_array
end

-- code = 'code_vmcf_above_40'
-- effect_table = {name='speed',modifier=0.2,time=1000(-100000=infinity)}
function add_effect_with_condition(index, code, effect_table, condition)
	if condition then
		effects_add(index, code, to_array(effect_table))
	else
		if table.maxn(global.effects[index][effect_table.name][5]) > 0 then
			for i,ef in pairs(global.effects[index][effect_table.name][5]) do
				if ef[1] == code then
					effects_remove(index, i, effect_table.name, effect_table.modifier)
				end
			end
		end
	end
end

-- calculate effect usages
--@ table contents is:
--@ effect_name_key={item or event, modifier, action time}
function effects_calc_on_tick(index, player)
	
	-- reduce speed when Energy is below 20%
	add_effect_with_condition(index,
	'code_energy_below_20%',
	{name='speed', modifier=-0.3, time=-100000},
	global.energy[index] <= global.energy_max[index] * 0.20)
	
	----------------- consider the effect Drinks fullness on the Energy consumption ---------------
	local drinks_for_energy_ussage_modifier = -1 * (settings.global["food-industry-drinks-modifier"].value / 100)
	if global.drinks[index] > 0 then
		if global.effects[index]["drinks_for_energy_usage"] and global.effects[index]["drinks_for_energy_usage"][3] == 0 then
			global.effects[index]["drinks_for_energy_usage"][1] = true
			global.effects[index]["drinks_for_energy_usage"][2] = drinks_for_energy_ussage_modifier
			global.effects[index]["drinks_for_energy_usage"][3] = 1
			global.effects[index]["drinks_for_energy_usage"][5][1]={"code_drinks_above_0",drinks_for_energy_ussage_modifier,-100000}
			if global.fi_energy_ussage_modifier[index] + drinks_for_energy_ussage_modifier > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] + drinks_for_energy_ussage_modifier
			end
		end
		-- disable Thirst
		if global.effects[index]["thirst"][1] then
			--writeDebug("[Debug]: deactivate Thirst.")
			global.effects[index]["thirst"][1] = false
			global.effects[index]["thirst"][2] = 0
			global.effects[index]["thirst"][3] = 14400
		end
	elseif global.drinks[index] <= 0 then
		-- reset effect value
		if global.effects[index]["drinks_for_energy_usage"] and global.effects[index]["drinks_for_energy_usage"][3] == 1 then
			if global.fi_energy_ussage_modifier[index] - drinks_for_energy_ussage_modifier > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - drinks_for_energy_ussage_modifier
			end
			global.effects[index]["drinks_for_energy_usage"][1] = false
			global.effects[index]["drinks_for_energy_usage"][2] = 0
			global.effects[index]["drinks_for_energy_usage"][3] = 0
			global.effects[index]["drinks_for_energy_usage"][5][1]={"code_drinks_is_0",0,-100000}
		end

		-- enable predisposition to Thirst
		if not global.effects[index]["thirst"][1] and global.effects[index]["thirst"][2] == 0 and global.effects[index]["thirst"][3] <= 0 then
			--writeDebug("[Debug]: activate Thirst preparation")
			global.effects[index]["thirst"][1] = true
			global.effects[index]["thirst"][2] = 1
			global.effects[index]["thirst"][3] = 21600
		-- enable Thirst
		elseif global.effects[index]["thirst"][1] and global.effects[index]["thirst"][2] == 1 and global.effects[index]["thirst"][3] <= 0 then
			--writeDebug("[Debug]: activate Thirst!")
			global.effects[index]["thirst"][1] = true
			global.effects[index]["thirst"][2] = 2
		end
	end

	-- ----------------------- Thirst effects -------------------------------
	local thirstLevel = function(value)  
		return global.effects[index]["thirst"][1] and
		 global.effects[index]["thirst"][2] == 2 and
		  math.ceil(math.abs(global.effects[index]["thirst"][3])/108000*100) >= value 
	end
	add_effect_with_condition(index,
		'code_thirst_above_20%',
		{name='speed', modifier=-0.2, time=-100000},
		thirstLevel(20)
	)
	add_effect_with_condition(index,
		'code_thirst_above_20%',
		{name='crafting', modifier=-0.2, time=-100000},
		thirstLevel(20)
	)
	add_effect_with_condition(index,
		'code_thirst_above_20%',
		{name='mining', modifier=-0.4, time=-100000},
		thirstLevel(20)
	)
	add_effect_with_condition(index,
		'code_thirst_above_80%',
		{name='mining', modifier=-0.5, time=-100000},
		thirstLevel(80)
	)


	-- more speed when drinks >= 90%!
	add_effect_with_condition(index,
	'code_drinks_above_90%',
	{name='speed', modifier=0.1, time=-100000},
	global.drinks[index] >= global.drinks_max[index] * 0.9
	)



    ----------------- consider the effect Substances fullness on the Energy consumption ---------------
	substances_for_energy_ussage_modifier = -1 * (settings.global["food-industry-substances-modifier"].value / 100)
	
	-- reduce Energy usage when substances >80% additionaly reduce by 10%
	if global.substances[index]["v"] > 80 and global.substances[index]["m"] > 80 and global.substances[index]["c"] > 80 and global.substances[index]["f"] > 80 then
		if global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 2 then
			global.effects[index]["substances_for_energy_usage"][1] = true
			global.effects[index]["substances_for_energy_usage"][2] = substances_for_energy_ussage_modifier - 0.1
			global.effects[index]["substances_for_energy_usage"][3]= 3
			global.effects[index]["substances_for_energy_usage"][5][1]={"code_vmcf_above_80%",substances_for_energy_ussage_modifier - 0.1,60*60}
			if global.fi_energy_ussage_modifier[index] - 0.1 > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - 0.1
			end
		end
	-- reduce Energy usage when substances >50% additionaly reduce by 10%
	elseif global.substances[index]["v"] > 50 and global.substances[index]["m"] > 50 and global.substances[index]["c"] > 50 and global.substances[index]["f"] > 50 then
		if global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 1 then
			global.effects[index]["substances_for_energy_usage"][1] = true
			global.effects[index]["substances_for_energy_usage"][2] = substances_for_energy_ussage_modifier - 0.1
			global.effects[index]["substances_for_energy_usage"][3] = 2
			global.effects[index]["substances_for_energy_usage"][5][1]={"code_vmcf_above_50%",substances_for_energy_ussage_modifier - 0.1,60*60}
			if global.fi_energy_ussage_modifier[index] - 0.1 > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - 0.1
			end
		end
	elseif (global.substances[index]["v"] * global.substances[index]["m"] * global.substances[index]["c"] * global.substances[index]["f"] > 0) then
		if global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 0 then
			global.effects[index]["substances_for_energy_usage"][1] = true
			global.effects[index]["substances_for_energy_usage"][2] = substances_for_energy_ussage_modifier
			global.effects[index]["substances_for_energy_usage"][3] = 1
			global.effects[index]["substances_for_energy_usage"][5][1]={"code_vmcf_above_0",substances_for_energy_ussage_modifier,60*60}
			if global.fi_energy_ussage_modifier[index] + substances_for_energy_ussage_modifier > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] + substances_for_energy_ussage_modifier
			end
		end
	elseif (global.substances[index]["v"] * global.substances[index]["m"] * global.substances[index]["c"] * global.substances[index]["f"] <= 0) then
		-- reset effect value
		if global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 1 then
			if global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier
			end
			global.effects[index]["substances_for_energy_usage"][1] = false
			global.effects[index]["substances_for_energy_usage"][2] = 0
			global.effects[index]["substances_for_energy_usage"][3] = 0
			global.effects[index]["substances_for_energy_usage"][5][1] = {"code_vmcf_is_0",0,0}
		elseif global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 2 then
			if global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier+0.1 > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier+0.1
			end
			global.effects[index]["substances_for_energy_usage"][1] = false
			global.effects[index]["substances_for_energy_usage"][2] = 0
			global.effects[index]["substances_for_energy_usage"][3] = 0
			global.effects[index]["substances_for_energy_usage"][5][1] = {"code_vmcf_is_0",0,0}
		elseif global.effects[index]["substances_for_energy_usage"] and global.effects[index]["substances_for_energy_usage"][3] == 3 then
			if global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier+0.2 > 1 then
				writeDebug("[Debug] Warning: global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index]..">1")
				global.fi_energy_ussage_modifier[index] = 0.99
			else
				global.fi_energy_ussage_modifier[index] = global.fi_energy_ussage_modifier[index] - substances_for_energy_ussage_modifier+0.2
			end
			global.effects[index]["substances_for_energy_usage"][1] = false
			global.effects[index]["substances_for_energy_usage"][2] = 0
			global.effects[index]["substances_for_energy_usage"][3] = 0
			global.effects[index]["substances_for_energy_usage"][5][1] = {"code_vmcf_is_0",0,0}
		end
	end
	--writeDebug("[Debug] global.fi_energy_ussage_modifier["..index.."] ="..global.fi_energy_ussage_modifier[index])
	
	-- nutrient balance bonus
	local minSubstances = function(index)
		return math.min(global.substances[index]["v"],
		global.substances[index]["m"],
		global.substances[index]["c"],
		global.substances[index]["f"])
	end
	
	------------------- consider the digestion effect ----------------
	-- TODO check effects substances on digestion speed
	add_effect_with_condition(index,
		'code_vmcf_above_40',
		{name='digestion', modifier=0.25, time=-100000},
		minSubstances(index) > 40)


	
	for i=1 ,10 do
		add_effect_with_condition(index,
		'code_vmcf_above_'..i,
		{name='speed', modifier=0.1 * i, time=-100000},
		 minSubstances(index) >= 10 * i 
		 and  minSubstances(index) < 10 * (i + 1)
		)
	end
	function substanceRange(key, i)
		return global.substances[index][key] >= 10 * i 
		and global.substances[index][key] < 10 * (i + 1)
	end
	for i=1 ,10 do
		add_effect_with_condition(index,
		'code_v_above_'..i,
		{name='mining', modifier=0.1 * i, time=-100000},
		substanceRange('v',i)
		)
	end
	for i=1 ,10 do
		add_effect_with_condition(index,
		'code_m_above_'..i,
		{name='crafting', modifier=0.1 * i, time=-100000},
		substanceRange('m',i)
		)
	end
	for i=1 ,10 do
		add_effect_with_condition(index,
		'code_c_above_'..i,
		{name='health_buffer', modifier=0.1 * i, time=-100000},
		substanceRange('c',i)
		)
	end
	for i=1 ,10 do
		add_effect_with_condition(index,
		'code_f_above_'..i,
		{name='health_buffer', modifier=0.1 * i, time=-100000},
		substanceRange('f',i)
		)
	end
 
	
	
	--writeDebug("global.effects[digestion] is:")
	--writeDebug(dump(global.effects[index]["digestion"]))
	
	
	-- TODO make effects: add_more_energy
	-- TODO make effects: add_more_drinks
	-- если в "животе" есть нужный напиток то...

	-- TODO remade effects: Regeneration
	--elseif effect == "Regeneration" then
	--player.character.health = player.character.health + 5


					---------------------- effects assignment -----------------------
					--for effect,t in pairs(global.effects[index]) do
					--	if t > 0 and player.character then
					--		global.effects[index][effect] = t - 5
					--		if effect == "Long reach" then
					--			player.character_build_distance_bonus = 100
					--			player.character_item_drop_distance_bonus = 20
					--			player.character_reach_distance_bonus = 120
					--		elseif effect == "Regeneration" then
					--			player.character.health = player.character.health + 5
					--		elseif effect == "Fast crafting" then
					--			player.character_crafting_speed_modifier = 50
					--		elseif effect == "Fast mining" then
					--			player.character_mining_speed_modifier = 20
					--		elseif effect == "Health buffer" then
					--			if global.effects[index]["Invulnerability"] and global.effects[index]["Invulnerability"] > 0 then
					--				player.character_health_bonus = 9750
					--			else
					--				player.character_health_bonus = 1250
					--			end
					--		end
	
	-- TODO сделать это как негативный эфект
	--		if effect == "Speed" then
	--			if global.energy[index] < global.energy_max[index] * 0.25 then -- if Energy level down below 25% - decrease running speed
	--				player.character_running_speed_modifier = (global.energy[index] - (global.energy_max[index] * 0.2))/global.energy_max[index]
	--			else
	--				player.character_running_speed_modifier = 0
	--			end
	--			if global.effects[index]["Speed"] and global.effects[index]["Speed"] > 0 then
	--				player.character_running_speed_modifier = (player.character_running_speed_modifier+1)*1.75-1
	--			end
	--		end

end


-- TODO make check some achievements function
function achievements_check(index, player)
	--global.fi_achievements[index]["gourmet"]
end


-- TODO make Sleep function
-- start or stop Sleep
function sleep_trg_on_tick(index, player)
	-- размещается в гланом on_tick там где "usage" activity и ставит маркер начала сна:
	
	-- TODO записать у вики: сон начинает считаться между -10 и 0
	if global.usage[index] > 0 and global.usage[index] < -10 then
		if global.effects[index]["sleep"][1] then
			-- сбрасываем значения сна
			global.effects[index]["sleep"][1] = false
			global.effects[index]["sleep"][2] = 0
			global.effects[index]["sleep"][3] = 14400
			global.effects[index]["sleep"][4] = 0
		end
	else
		if not global.effects[index]["sleep"][1] then
			-- включаем подготовку ко сну 1 этап
			global.effects[index]["sleep"][1] = true
			global.effects[index]["sleep"][4] = 1
			global.effects[index]["sleep"][5][1] = {"self_sleep_1", 1, 0, 1}
		end
	end
	
	--writeDebug("sleep is:")
	--writeDebug(dump(global.effects[index]["sleep"]))
end
function sleep_calc_on_tick(index, player)
	-- OPTIMIZE translate coooments
	--@ есть 3 стадии
	--@ 1 этап - подготовка ко сну 4 минуты
	if global.effects[index]["sleep"][1] and global.effects[index]["sleep"][4] == 1 then
		if global.effects[index]["sleep"][3] - 1200 > 0 then
			global.effects[index]["sleep"][3] = global.effects[index]["sleep"][3] - 1200
		else
			global.effects[index]["sleep"][3] = 21600
			global.effects[index]["sleep"][4] = 2
		end
		--@ 6 мин - длится "лекгий сон" = 25% Energy usage
	elseif global.effects[index]["sleep"][1] and global.effects[index]["sleep"][4] == 2 then
		if global.effects[index]["sleep"][3] - 1200 > 0 then
			global.effects[index]["sleep"][3] = global.effects[index]["sleep"][3] - 1200
		--@ итого - прошло 10 мин
		else
			global.effects[index]["sleep"][2] = 0.25
			global.effects[index]["sleep"][3] = 0
			global.effects[index]["sleep"][4] = 3
		end
		--@ затем начинается "глубокий сон" - расход 0%
	elseif global.effects[index]["sleep"][1] and global.effects[index]["sleep"][4] == 3 then
		-- @ global.effects[index]["sleep"] = {0, 14400, false}
		--@ включаем "глубокий сон"
		global.effects[index]["sleep"][2] = 1
		global.effects[index]["sleep"][3] = 0
		global.effects[index]["sleep"][4] = 4
	end

	--writeDebug("sleep is:")
	--writeDebug(dump(global.effects[index]["sleep"]))
end


function neutralize_active_effects(index, item_name, effect_data)
	writeDebug("[Debug] Used neutralize_active_effects")
	-- TODO simple-neutralizing-capsule function
	--Проверяет эффекты
	--Проверяет коэффициенты
	--Учитывает время срабатывания нейтрализирующего эффекта
	
		--for effect,t in pairs(global.effects[event.player_index]) do
		--	global.effects[event.player_index][effect] = 0
		--end
end
