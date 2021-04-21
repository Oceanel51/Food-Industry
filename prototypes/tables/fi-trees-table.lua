--require "stdlib.table"


-- function collect_all_foods_table()
-- 	local all_foods = {}
	
-- 	--table.insert(all_foods, x, y)
-- 	--table.insert(all_foods, x, y)
-- 	all_foods = table.merge(foods_table(),drinks_table(),true)
	
-- 	return all_foods
-- end


function trees_table()
	local trees = {
	--  1								  2								  3		  4			  5				  6		  7		  8		  9
	--name,								type,							energy,	drinks,	{V,M,C,F},			fullness, c_f,	health,	effect/s
	--{"corn",							"vegan-substances1",			3,		-2,		{0,1.6,0,0.8},		24,		24,		-1,		{} },
}

	return trees
end


-- plants as tree also
function trees_variations()
	local variations = { -- (stages)
	--				1		2			3			4				5							6					7					8					9
	["apple"] = 	{"seed", "seedling", "sapling", "young-tree", "young-sick-old-tree", 	"young-old-tree",	"adult-tree", "adult-sick-old-tree",	"adult-old-tree"},
	["orange"] = 	{"seed", "seedling", "sapling", "young-tree", "young-sick-old-tree", 	"young-old-tree",	"adult-tree", "adult-sick-old-tree",	"adult-old-tree"},
	--{"banana", 	{		 "seedling", "sapling", "young-tree", "young-sick-old-tree", 	"young-old-tree",	"adult-tree", "adult-sick-old-tree",	"adult-old-tree"}},
	--{"pineapple", {		 "seedling", "sapling", "young-tree",												"adult-tree", "adult-sick-old-tree",	"adult-old-tree"}},
	
	--{["wheat"] = 	{"seed", "seedling", "sapling", "young-1", "young-2", "young-3", 			"young-old",	"adult-1", "adult-2", "adult-3",		"adult-old"}}
	["wheat"] = 	{"seed", "seedling"}
	}

	return variations
end


-- make trees filter
local function trees_filter()
	local filter = {}

	return filter
end

