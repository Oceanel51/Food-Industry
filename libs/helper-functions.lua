-- helper functions, wich I found in net


-- https://stackoverflow.com/a/42062321
function print_table(node)
    -- to make output beautiful
    local function tab(amt)
        local str = ""
        for i=1,amt do
            str = str .. "\t"
        end
        return str
    end

    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. tab(depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. tab(depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. tab(depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. tab(depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    print(output_str)
end


-- https://stackoverflow.com/a/27028488
function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end


-- https://stackoverflow.com/questions/1252539/most-efficient-way-to-determine-if-a-lua-table-is-empty-contains-no-entries
function table.empty(self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end


-- https://stackoverflow.com/questions/1758991/how-to-remove-a-lua-table-entry-by-its-key
function table.removekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end


-- https://swfoo.com/2014/07/11/lua-table-remove-by-key/
-- Remove key k (and its value) from table t. Return a new (modified) table.
function table.removeKeyTwo(t, k)
	local i = 0
	local keys, values = {},{}
	for k,v in pairs(t) do
		i = i + 1
		keys[i] = k
		values[i] = v
	end
 
	while i>0 do
		if keys[i] == k then
			table.remove(keys, i)
			table.remove(values, i)
			break
		end
		i = i - 1
	end
 
	local a = {}
	for i = 1,#keys do
		a[keys[i]] = values[i]
	end
 
	return a
end


-- https://stackoverflow.com/a/52922737
local function removebyKey(tab, val)
    for i, v in ipairs (tab) do 
        if (v.id == val) then
          tab[i] = nil
        end
    end
end


-- https://stackoverflow.com/a/40149286
--@ You can use it to check if a value exists:
--@   local myFruit = "apple"
--@   if (table.find({"apple", "pear", "berry"}, myFruit)) then
--@       print(table.find({"apple", "pear", "berry"}, myFruit)) -- 1
--@ You can use it to find the key:
--@   local fruits = {
--@       apple = {color="red"},
--@       pear = {color="green"},
--@   }
--@   local myFruit = fruits.apple
--@   local fruitName = table.find(fruits, myFruit)
--@   print(fruitName) -- "apple"
--@ I hope the recursive parameter speaks for itself.
--@ The returnBool parameter is a safe-guard for when you have tables that have false as a key in a table (Yes that's possible: fruits = {false="apple"})
function table.findTree(t, val, recursive, metatables, keys, returnBool)
    if (type(t) ~= "table") then
        return nil
    end

    local checked = {}
    local _findInTable
    local _checkValue
    _checkValue = function(v)
        if (not checked[v]) then
            if (v == val) then
                return v
            end
            if (recursive and type(v) == "table") then
                local r = _findInTable(v)
                if (r ~= nil) then
                    return r
                end
            end
            if (metatables) then
                local r = _checkValue(getmetatable(v))
                if (r ~= nil) then
                    return r
                end
            end
            checked[v] = true
        end
        return nil
    end
    _findInTable = function(t)
        for k,v in pairs(t) do
            local r = _checkValue(t, v)
            if (r ~= nil) then
                return r
            end
            if (keys) then
                r = _checkValue(t, k)
                if (r ~= nil) then
                    return r
                end
            end
        end
        return nil
    end

    local r = _findInTable(t)
    if (returnBool) then
        return r ~= nil
    end
    return r
end


-- https://stackoverflow.com/a/664557
--@ higher-order list-searching function:
function table.find(f, l) -- find element v of l satisfying f(v)
    for _, v in ipairs(l) do
        if f(v) then
            return v
        end
    end
    return nil
end


-- https://stackoverflow.com/a/23015741
function valid(data, array)
    local valid = {}
    for i = 1, #array do
        valid[array[i]] = true
    end
    if valid[data] then
        return false
    else
        return true
    end
end


--------------------------------------------------------------------
--- DeBugs Messages 
--------------------------------------------------------------------
-- \Bio_Industries_2.6.11\control.lua
function writeDebug(message)
	local QC_Mod = true
	
	if QC_Mod == true then 
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end
