local group_pos = 8
local wheat_table = {
    --1				2		3				4		5		6		7			8		9			10		11		12					13
    --name,			time,	ingredients,	plants,	result,	seeds, 	stack size,	plant?,	seed?,	edible?,	straws,	fuel for compost,	stack
    "wheat",		500,	90,				12,		10.0, 	8.0, 	100,		true,	true,		false,	6.0,	"2J",				100
}

data:extend({

{
    type = "item-subgroup",
    name = wheat_table[1],
    group = "food-industry-foods",
    order = "w-d-"..group_pos,
},
{
    type = "item",
    name = wheat_table[1],
    icon = "__FoodIndustry__/graphics/icons/plants/"..wheat_table[1]..".png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = wheat_table[1],
    order = "w-d-"..group_pos.."-z",
    stack_size = 50,
    fuel_category = "plant",
    fuel_value = "2J",
},
-- зёрна для посадки
-- {
--     type = "item",
--     name = wheat_table[1].."-seeds",
--     icon = "__FoodIndustry__/graphics/icons/items/"..plant[1].."-seeds.png",
--     icon_size = 64,
--     icon_mipmaps = 4,
--     subgroup = wheat_table[1],
--     order = "w-d-"..group_pos.."-z",
--     stack_size = 50,
--     place_result = wheat_table[1].."-seed",
--     fuel_category = "plant",
--     fuel_value = "0.4J",
-- }
-- зёрна для употребления и переработки
{
    type = "item",
    name = wheat_table[1].."-grains",
    icon = "__FoodIndustry__/graphics/icons/items/"..wheat_table[1].."-grains.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = wheat_table[1],
    order = "w-d-"..group_pos.."-z",
    stack_size = wheat_table[13],
    fuel_category = "plant",
    fuel_value = "1J",
},
-- TODO wheat-flour
{
    type = "item",
    name = wheat_table[1].."-flour",
    icon = "__FoodIndustry__/graphics/icons/items/"..wheat_table[1].."-flour.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = wheat_table[1],
    order = "w-d-"..group_pos.."-z",
    stack_size = 50,
},
{
    type = "item",
    name = wheat_table[1].."-dough",
    icon = "__FoodIndustry__/graphics/icons/items/"..wheat_table[1].."-dough.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = wheat_table[1],
    order = "w-d-"..group_pos.."-z",
    stack_size = 20,
},

})


