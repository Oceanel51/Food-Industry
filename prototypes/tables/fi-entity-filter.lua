local validEntityName = {
	["fi-basic-farmland"]	= 1,
	["apple-seed"]			= 1,
	["apple-seedling"]		= 1,
	["apple-sapling"]		= 1,
	["orange-seed"]			= 1,
	["orange-seedling"]		= 1,
	["orange-sapling"]		= 1,
	["wheat-seed"]			= 1,
	["wheat-seedling"]		= 1,
	["cattle-feeder"]		= 1,
	["cattle-grabber"]		= 1,
	["fish-farm"]			= 1,
	["sturgeon-farm"]		= 1,
	["food-picker"]		    = 1,
	["burner-food-picker"]  = 1,
	--['nixie-tube-small']	= 2
}

local function create_filters()
	
    local filters = {}
    local names = {}
    for name in pairs(validEntityName) do
      filters[#filters+1] = {filter="name",name=name}
      filters[#filters+1] = {filter="ghost_name",name=name}
      names[#names+1] = name
    end
    
    -- EXample
	-- filters = {
	-- 	{ filter = "name", name = "apple-seedling" },
	-- 	{ filter = "ghost_name", name = "apple-seedling" },
	-- }
	
	
	return filters
end

return create_filters()