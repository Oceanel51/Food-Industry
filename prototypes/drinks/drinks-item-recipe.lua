require "libs.helper-functions"


local foods = {
	--1								2		3		4						5		6		7						8			9																			10
	--name,							stack,	cool,	category,				time,	amount,	subgroup,				enabled,	ingredients,																tint for liquid color
	{"flask-pure-water",			10,		0.5,	"crafting-with-fluid",	3.0,	1,		"drinks-pure-water",	true,		{{"flask", 1}, {type="fluid", name="pure-water", amount=30}},				{r=0.0,g=0.6,b=1.0,a=0.6} },
	{"plastic-bottle-pure-water",	10,		0.5,	"crafting-with-fluid",	5.0,	1,		"drinks-pure-water",	false,		{{"plastic-bottle", 1}, {type="fluid", name="pure-water", amount=60}},		{r=0.0,g=0.5,b=1.0,a=0.5} },
	--{"glass-bottle-pure-water",		10,		0.5,	"crafting-with-fluid",	6.0,	1,		"drinks-pure-water",	false,		{{"glass-bottle", 1}, {type="fluid", name="pure-water", amount=50}},		{r=0.0,g=0.5,b=1.0,a=0.8} },
	{"simple-capsule-pure-water",	20,		0.7,	"crafting-with-fluid",	3.0,	1,		"drinks-pure-water",	false,		{{"basic-shell-capsule", 2}, {type="fluid", name="pure-water", amount=32}},	{r=0.0,g=0.5,b=1.0,a=0.5} },
	-- juices
	{"plastic-bottle-apple-juice",	10,		0.8,	"crafting-with-fluid",	5.5,	1,		"drinks-apple",			false,		{{"plastic-bottle", 1}, {type="fluid", name="apple-juice", amount=60}},		{r=213/255, g=141/255, b=65/255, a=155/255} },
	{"plastic-bottle-orange-juice",	10,		0.8,	"crafting-with-fluid",	6.5,	1,		"drinks-orange",		false,		{{"plastic-bottle", 1}, {type="fluid", name="orange-juice", amount=60}},	{r=245/255, g=161/255, b=0, a=229/255} },
	-- TODO add other juices
	--{"glass-bottle-apple-juice",	10,		0.7,	"crafting-with-fluid",	6.5,	1,		"drinks-apple",			false,		{{"glass-bottle", 1}, {type="fluid", name="apple-juice", amount=50}},		{r=213/255, g=141/255, b=65/255, a=221/255} },
	--{"paper-package-apple-juice",	10,		0.6,	"crafting-with-fluid",	7.5,	1,		"drinks-apple",			false,		{{"paper-packaging", 1}, {type="fluid", name="apple-juice", amount=40}},	{r=213/255, g=141/255, b=65/255, a=221/255} },
	--{"glass-bottle-tomato-juice",	10,		0.8,	"crafting-with-fluid",	5.5,	1,		"drinks-tomato",		false,		{{"glass-bottle", 1}, {type="fluid", name="tomato-juice", amount=60}},		{r=219/255, g=56/255, b=48/255, a=236/255} },
}


for i, f in pairs(foods) do
	--log("[FI Debug] item and recipe - "..f[1])
	--local sg = "drinks-pure-water"
	--local rn = f[1]
	--if f[7] == "test" then 
	--	sg = "effect"
	--	rn = f[1].."-"..f[9][1][1]
	--end
	local icon1 = ""
	local icon2 = ""
	if string.match(f[1], "flask") == "flask" then
		icon1 = "flask-full"
		icon2 = "flask-full-mask"
	elseif string.match(f[1], "plastic%-bottle") == "plastic-bottle" then
		icon1 = "plastic-bottle-full"
		if f[10]["a"] >= 9 then
			icon2 = "plastic-bottle-full-mask-9"
		elseif f[10]["a"] >= 7 then
			icon2 = "plastic-bottle-full-mask-7"
		elseif f[10]["a"] >= 5 then
			icon2 = "plastic-bottle-full-mask-5"
		elseif f[10]["a"] >= 2 then
			icon2 = "plastic-bottle-full-mask-2"
		else
			icon2 = "plastic-bottle-full-mask"
		end
	elseif string.match(f[1], "glass%-bottle") == "glass-bottle" and data.raw.item["glass"] then
		--log("[FI Debug] glass-bottle item and recipe - "..f[1])
		-- TODO add glass tara
	elseif string.match(f[1], "^simple%-capsule") == "simple-capsule" then
		icon1 = "simple-capsule-pure-water"
		icon2 = "simple-capsule-pure-water-mask"
	end

	if icon1 == "" or icon2 == "" then break end

	data:extend({
		{
			type = "capsule",
			name = f[1],
			--icon = "__FoodIndustry__/graphics/icons/drinks/"..f[1]..".png",
			icons = {
				{ icon = "__FoodIndustry__/graphics/icons/drinks/"..icon1..".png", },
				{
					icon = "__FoodIndustry__/graphics/icons/drinks/"..icon2..".png",
					tint = f[10]
					--scale = 0.7 * 32 / icon_size,
					--shift = {0, 0},
				},
			},
			icon_size = 64,
			subgroup = f[7],
			order = "w-d"..i,
			stack_size = f[2],
			capsule_action = {
				attack_parameters = {
					ammo_category = "capsule",
					ammo_type = {
						action = {
							action_delivery = {
								target_effects = {
									damage = {
										amount = 0,
										type = "physical"
									},
									type = "damage"
								},
								type = "instant"
							},
							type = "direct"
						},
						category = "capsule",
						target_type = "position"
					},
					cooldown = f[3]*60,
					range = 0,
					type = "projectile"
				},
				type = "use-on-self"
			},
		},
		
		-- fill recipes
		{
			type = "recipe",
			name = f[1],
			enabled = f[8],
			--icon = "__FoodIndustry__/graphics/icons/drinks/"..f[1]..".png",
			icons = {
				{ icon = "__FoodIndustry__/graphics/icons/drinks/"..icon1..".png", },
				{
					icon = "__FoodIndustry__/graphics/icons/drinks/"..icon2..".png",
					tint = f[10]
				},
			},
			icon_size = 64,
			category = f[4],
			subgroup = f[7],
			order = "w-d"..i,
			energy_required = f[5],
			ingredients = f[9],
			results = {{f[1], f[6]}}
		},
	})

	-- insert juice recipes to "fruit-juicing" technology
	if string.match(f[1], "juice$") == "juice" then
		--log("[FI Debug] recipe - "..f[1].." insert to fruit-juicing tech")
		table.insert(data.raw.technology["fruit-juicing"].effects,{recipe = f[1], type = "unlock-recipe"})
	--elseif string.match(f[1], "^plastic") == "plastic" then
	--	table.insert(data.raw.technology["plastics"].effects,{recipe = f[1], type = "unlock-recipe"})
	elseif string.match(f[1], "^simple%-capsule") == "simple-capsule" then
		table.insert(data.raw.technology["effect-capsules"].effects,{recipe = f[1], type = "unlock-recipe"})
	end

end
