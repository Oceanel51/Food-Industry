require "libs.helper-functions"


local foods = {
--1									2					3		4		5						6		7		8				9			10					11
--name,								subgroup,			stack,	cool,	crafting category,		time,	amount,	order,			recipe_version,	ingredients,	results
{"cooked-corn",						"foods-vegan",		10,		0.5,	"cooking",				4.0,	1,		"w-d-a",		nil,		{{"corn", 1}, {type="fluid", name="pure-water", amount=5}} },
{"whole-wheat-cookie",				"wheat",			10,		0.5,	"cooking",				3.5,	1,		"w-d-c",		nil,		{{"wheat-grains", 3}} },
--{"wheat-porridge",					"foods-vegan",		10,		0.5,	"cooking",				5.0,	1,		"w-d-cb",		nil,		{{"wheat-grains", 2}, {type="fluid", name="pure-water", amount=7}} },
{"apple-peeled",					"apple",			10,		0.5,	"crafting",				3.0,	1,		"w-d-apple-y",	nil,		{{"apple", 1}}, {{"apple-peeled", 1}, {type = "item", name = "raw-straw", amount_min=0, amount_max=2}} },
{"orange-peeled",					"orange",		 	10,		0.5,	"crafting",				3.0,	1,		"w-d-orange-y",	nil,		{{"orange", 1}}, {{"orange-peeled", 1}, {type = "item", name = "raw-straw", amount_min=1, amount_max=2}} },
{"bread",							"foods-vegan",		10,		0.5,	"cooking",				7.0,	1,		"w-d-cc",		nil,		{{"wheat-dough", 1}} },
{"corn-bread",						"foods-vegan",		10,		0.5,	"cooking",				8.0,	1,		"w-d-c",		nil,		{{"corn-dough", 1}} },
{"popcorn",							"foods-vegan",		50,		0.2,	"cooking",				1.5,	1,		"w-d-d",		nil,		{{"corn-seeds", 1}, {type="fluid", name="canola-oil", amount=1}} },
{"basic-salad",						"foods-vegan",		10,		0.5,	"cooking",				1.5,	1,		"w-d-b",		nil,		{{"tomato", 2}, {"cucumber", 1}, {"lettuce", 3}} },
{"cooked-soy",						"foods-vegan",		50,		0.2,	"cooking",				3.0,	5,		"w-d-e",		nil,		{{"soy", 5}, {type="fluid", name="pure-water", amount=20}} },
{"baked-potato",					"foods-vegan",		10,		0.5,	"cooking",				7.0,	1,		"w-d-f",		nil,		{{"potato", 1}} },
{"fries",							"foods-vegan",		10,		0.5,	"cooking",				6.0,	1,		"w-d-g",		nil,		{{"raw-fries", 1}, {type="fluid", name="canola-oil", amount=6}} },
{"ketchup-fries",					"foods-vegan",		10,		0.5,	"advanced-cooking",		0.5,	1,		"w-d-i",		nil,		{{"fries", 1}, {type="fluid", name="ketchup", amount=1}} },
{"pickles",							"foods-vegan",		50,		0.3,	"cooking",				40.0,	5,		"w-d-h",		nil,		{{"cucumber", 5}, {"crystal", 1}, {type="fluid", name="pure-water", amount=35}} },
{"best-salad",						"foods-vegan",		5,		0.5,	"advanced-cooking",		1.5,	1,		"w-d-n",		nil,		{{"lettuce", 4}, {"tomato", 3}, {"pickles", 1}, {"corn-seeds", 2}, {type="fluid", name="soy-sauce", amount=1}} },
{"tofu",							"foods-vegan",		10,		0.5,	"chemistry",			4.0,	2,		"w-d-l",		nil,		{{"crystal", 1}, {type="fluid", name="soy-milk", amount=24}, {type="fluid", name="sulfuric-acid", amount=1}} },
{"tofu-pizza",						"foods-vegan",		5,		0.5,	"cooking",				5.0,	1,		"w-d-m",		nil,		{{"corn-flour", 2}, {"tomato", 3}, {"tofu", 1}, {type="fluid", name="ketchup", amount=2}} }, -- TODO add carton package
{"tofu-burger",						"foods-vegan",		5,		0.5,	"cooking",				5.0,	1,		"w-d-k",		nil,		{{"corn-bread", 1}, {"tomato", 2}, {"pickles", 2}, {"lettuce", 1}, {"tofu", 1}, {type="fluid", name="ketchup", amount=1}} }, -- TODO add carton package
-- species see in prototypes\recipe.lua
--{"salt",							"foods-species",	100,	0.6,	"mixing",				20.0,	10,		false,		"w-a-a",		{{"crystal", 1}} },
--{"sugar",							"foods-species",	100,	0.6,	"cooking",				30.0,	5,		false,		"w-b-a",		{{"sugarcane", 2},} },
{"gelatine-granules",				"foods-species",	100,	0.6,	"cooking",				80.0,	10,		"w-b-6",		nil,		{{"substance-c", 3},} },
-- fish
{"cooked-fish-meat",				"foods-fish",		10,		0.3,	"cooking",				3.0,	1,		"w-d-a1",		nil,		{{"fish-meat-red", 1}, {"corn-flour", 1},} },
{"cooked-fish-meat",				"foods-fish",		10,		0.3,	"cooking",				3.0,	1,		"w-d-a0",		"2",		{{"fish-meat-red", 1}, {"wheat-flour", 2},} },
{"fish-salad",						"foods-fish",		5,		0.5,	"cooking",				1.5,	1,		"w-d-a2",		nil,		{{"basic-salad", 1}, {"corn-seeds", 3}, {"cooked-fish-meat", 1},} },
{"fish-steak",						"foods-fish",		10,		0.5,	"cooking",				12.0,	1,		"w-d-a3",		nil,		{{"fish-meat-red", 1}, {"corn-flour", 1}, {type="fluid", name="canola-oil", amount=2},} },
{"fish-and-chips",					"foods-fish",		5,		0.5,	"cooking",				1.5,	1,		"w-d-b1",		nil,		{{"fish-steak", 1}, {"fries", 1},} },
{"fish-pizza",						"foods-fish",		5,		0.5,	"advanced-cooking",		5.0,	1,		"w-d-b2",		nil,		{{"corn-flour", 2}, {"tomato", 3}, {"fish-steak", 1}, {type="fluid", name="ketchup", amount=2},} },
{"fish-burger",						"foods-fish",		5,		0.5,	"advanced-cooking",		5.0,	1,		"w-d-b3",		nil,		{{"corn-bread", 1}, {"tomato", 2}, {"pickles", 2}, {"lettuce", 1}, {"fish-steak", 1}, {type="fluid", name="ketchup", amount=1},} },
-- meat
{"cooked-biter-meat",				"foods-meat",		10,		0.5,	"cooking",				35.0,	1,		"w-d-e",		"early",	{{"biter-meat", 2}, {"flask-pure-water", 1}}, {{"cooked-biter-meat", 2}, {"flask", 1}} },
{"cooked-biter-meat",				"foods-meat",		10,		0.5,	"cooking",				12.0,	1,		"w-d-f",		nil,		{{"biter-meat", 1}, {type="fluid", name="pure-water", amount=7}} },
{"biter-steak",						"foods-meat",		10,		0.5,	"cooking",				12.0,	1,		"w-d-g",		nil,		{{"biter-meat", 1}, {type="fluid", name="canola-oil", amount=2}} },
{"schnitzel",						"foods-meat",		10,		0.5,	"cooking",				12.0,	1,		"w-d-h",		nil,		{{"biter-meat", 1}, {"corn-flour", 1}, {type="fluid", name="canola-oil", amount=5}} },
{"pizza",							"foods-meat",		5,		0.5,	"cooking",				5.0,	1,		"w-d-i",		nil,		{{"corn-flour", 2}, {"tomato", 3}, {"biter-steak", 1}, {type="fluid", name="ketchup", amount=2}} },
{"burger",							"foods-meat",		5,		0.5,	"cooking",				5.0,	1,		"w-d-k",		nil,		{{"corn-bread", 1}, {"tomato", 2}, {"pickles", 2}, {"lettuce", 1}, {"biter-steak", 1}, {type="fluid", name="ketchup", amount=1}} },
-- food capsules
{"food-1-capsule",					"food-capsules",	10,		0.5,	"advanced-cooking",		80.0,	1,		"w-cb-ai",		nil,		{{"substances-dust", 110}, {"gelatine-granules", 8}} },
{"food-12-capsule",					"food-capsules",	30,		0.5,	"cooking",				38.0,	1,		"w-cb-ae",		nil,		{{"substances-dust", 54}, {"gelatine-granules", 3}} },
{"food-16-capsule",					"food-capsules",	120,	0.5,	"food-capsules",		18.0,	1,		"w-cb-aa",		nil,		{{"substances-dust", 20}} },
{"simple-food-vmc-capsule",			"food-capsules",	50,		0.5,	"food-capsules",		20.0,	1,		"w-cf-ba",		nil,		{{"substance-v", 6}, {"substance-m", 6}, {"substance-c", 6}} },
{"simple-food-vmf-capsule",			"food-capsules",	50,		0.5,	"food-capsules",		20.0,	1,		"w-cf-bb",		nil,		{{"substance-v", 6}, {"substance-m", 6}, {"substance-f", 5}} },
{"simple-food-mcf-capsule",			"food-capsules",	50,		0.5,	"food-capsules",		20.0,	1,		"w-cf-bc",		nil,		{{"substance-m", 6}, {"substance-c", 6}, {"substance-f", 5}} },
{"simple-food-vcf-capsule",			"food-capsules",	50,		0.5,	"food-capsules",		20.0,	1,		"w-cf-bd",		nil,		{{"substance-v", 6}, {"substance-c", 6}, {"substance-f", 5}} },
{"basic-food-vm-capsule",			"food-capsules",	20,		0.5,	"cooking",				40.0,	1,		"w-cf-be",		nil,		{{"substance-v", 20}, {"substance-m", 20}, {"basic-shell-capsule", 1}, {type="fluid", name="pure-water", amount=20}} },
{"basic-food-vc-capsule",			"food-capsules",	20,		0.5,	"cooking",				40.0,	1,		"w-cf-bf",		nil,		{{"substance-v", 20}, {"substance-c", 20}, {"basic-shell-capsule", 1}, {type="fluid", name="pure-water", amount=20}} },
{"basic-food-mc-capsule",			"food-capsules",	20,		0.5,	"cooking",				40.0,	1,		"w-cf-bg",		nil,		{{"substance-m", 20}, {"substance-c", 20}, {"basic-shell-capsule", 1}, {type="fluid", name="pure-water", amount=20}} },
{"basic-food-cf-capsule",			"food-capsules",	20,		0.5,	"cooking",				40.0,	1,		"w-cf-bh",		nil,		{{"substance-c", 20}, {"substance-f", 20}, {"basic-shell-capsule", 1}, {type="fluid", name="pure-water", amount=20}} },
{"advanced-food-v-capsule",			"food-capsules",	10,		0.5,	"advanced-cooking",		60.0,	1,		"w-cf-bk",		nil,		{{"substance-v", 50}, {"advanced-shell-capsule", 2}, {type="fluid", name="pure-water", amount=60}} },
{"advanced-food-m-capsule",			"food-capsules",	10,		0.5,	"advanced-cooking",		60.0,	1,		"w-cf-bl",		nil,		{{"substance-m", 50}, {"advanced-shell-capsule", 2}, {type="fluid", name="pure-water", amount=60}} },
{"advanced-food-c-capsule",			"food-capsules",	10,		0.5,	"advanced-cooking",		60.0,	1,		"w-cf-bm",		nil,		{{"substance-c", 50}, {"advanced-shell-capsule", 2}, {type="fluid", name="pure-water", amount=60}} },
{"advanced-food-f-capsule",			"food-capsules",	10,		0.5,	"advanced-cooking",		60.0,	1,		"w-cf-bn",		nil,		{{"substance-f", 50}, {"advanced-shell-capsule", 2}, {type="fluid", name="pure-water", amount=60}} },
-- effect capsules
{"simple-speed-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-a-aa",	nil,		{{"substance-c", 10}, {"basic-shell-capsule", 2}, 						{"substances-dust", 10}} },
{"simple-speed-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-a-ab",	"2",		{{"substance-c", 5},  {"basic-shell-capsule", 2}, {"substance-v", 5}, 	{"substances-dust", 10}} },
{"simple-crafting-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-b-aa",	nil,		{{"substance-v", 10}, {"basic-shell-capsule", 2}, 						{"substances-dust", 10}} },
{"simple-crafting-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-b-ab",	"2",		{{"substance-v", 5},  {"basic-shell-capsule", 2}, {"substance-m", 5}, 	{"substances-dust", 10}} },
{"simple-mining-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-c-aa",	nil,		{{"substance-c", 10}, {"basic-shell-capsule", 2}, 						{"substances-dust", 10}} },
{"simple-mining-capsule",			"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-c-ab",	"2",		{{"substance-c", 5},  {"basic-shell-capsule", 2}, {"substance-v", 5}, 	{"substances-dust", 10}} },
{"simple-long-reach-capsule",		"effect",			50,		0.5,	"advanced-crafting",	80.0,	1,		"w-ce-d-aa",	nil,		{{"substance-m", 10}, {"basic-shell-capsule", 2}, 						{"substances-dust", 10}} },
-- TODO check capsules
{"basic-speed-capsule",				"effect",			20,		0.5,	"advanced-crafting",	120.0,	1,		"w-ce-a-ba",	nil,		{{"substance-c", 30}, {"advanced-shell-capsule", 1}, {"fast-inserter", 2}} },
{"basic-crafting-capsule",			"effect",			20,		0.5,	"advanced-crafting",	120.0,	1,		"w-ce-b-ba",	nil,		{{"substance-v", 30}, {"advanced-shell-capsule", 1}, {"steel-plate", 4}} },
{"basic-mining-capsule",			"effect",			20,		0.5,	"advanced-crafting",	120.0,	1,		"w-ce-c-ba",	nil,		{{"substance-c", 30}, {"advanced-shell-capsule", 1}, {"steel-plate", 4}} },
{"basic-long-reach-capsule",		"effect",			20,		0.5,	"advanced-crafting",	120.0,	1,		"w-ce-d-ba",	nil,		{{"substance-m", 30}, {"advanced-shell-capsule", 1}, {"long-handed-inserter", 2}} },
{"advanced-speed-capsule",			"effect",			10,		0.5,	"centrifuging",			180.0,	1,		"w-ce-a-ca",	nil,		{{"substance-c", 60}, {"uranium-235", 1}, {"speed-module-2", 1}, {"advanced-shell-capsule", 2}} },
{"advanced-crafting-capsule",		"effect",			10,		0.5,	"centrifuging",			180.0,	1,		"w-ce-b-ca",	nil,		{{"substance-v", 60}, {"uranium-235", 1}, {"productivity-module", 1}, {"advanced-shell-capsule", 2}} },
{"advanced-mining-capsule",			"effect",			10,		0.5,	"centrifuging",			180.0,	1,		"w-ce-c-ca",	nil,		{{"substance-c", 60}, {"uranium-235", 1}, {"steel-plate", 5}, {"advanced-shell-capsule", 2}} },
{"advanced-long-reach-capsule",		"effect",			10,		0.5,	"centrifuging",			180.0,	1,		"w-ce-d-ca",	nil,		{{"substance-m", 60}, {"uranium-235", 1}, {"long-handed-inserter", 3}, {"advanced-shell-capsule", 2}} },

{"basic-regen-capsule",				"effect",			20,		0.5,	"advanced-cooking",		120.0,	1,		"w-ce-g-ba",	nil,		{{"substance-c", 10}, {"substance-f", 20}, {"advanced-shell-capsule", 1}, {"effectivity-module", 1}, {type="fluid", name="pure-water", amount=60}} },
{"advanced-regen-capsule",			"effect",			10,		1.0,	"centrifuging",			180.0,	1,		"w-ce-g-ca",	nil,		{{"substance-c", 20}, {"substance-f", 40}, {"advanced-shell-capsule", 2}, {"effectivity-module", 1}, {type="fluid", name="pure-water", amount=120}} },
{"basic-health-buffer-capsule",		"effect",			20,		1.6,	"advanced-cooking",		120.0,	1,		"w-ce-h-ba",	nil,		{{"substance-f", 30}, {"advanced-shell-capsule", 1}, {"light-armor", 1}, {type="fluid", name="pure-water", amount=80}} },
{"advanced-health-buffer-capsule",	"effect",			10,		3.2,	"centrifuging",			180.0,	1,		"w-ce-h-ca",	nil,		{{"substance-f", 60}, {"advanced-shell-capsule", 2}, {"heavy-armor", 1}, {type="fluid", name="pure-water", amount=160}, {"uranium-235", 1}} },

{"simple-digestive-capsule",		"effect",			50,		0.8,	"cooking",				80.0,	1,		"w-ce-e-aa",	nil,		{{"corn-flour", 2}, {"basic-shell-capsule", 1}, {type="fluid", name="pure-water", amount=10}} },
{"basic-digestive-capsule",			"effect",			20,		0.10,	"advanced-cooking",		120.0,	1,		"w-ce-e-ba",	nil,		{{"corn-flour", 10}, {"advanced-shell-capsule", 1}, {type="fluid", name="pure-water", amount=30}} },
{"advanced-digestive-capsule",		"effect",			10,		0.15,	"centrifuging",			180.0,	1,		"w-ce-e-ca",	nil,		{{"corn-flour", 30}, {"advanced-shell-capsule", 2}, {type="fluid", name="pure-water", amount=80}} },
{"basic-sleep-capsule",				"effect",			20,		1.0,	"advanced-cooking",		120.0,	1,		"w-ce-f-ba",	nil,		{{"substance-m", 20}, {"substance-c", 20}, {"advanced-shell-capsule", 3}, {type="fluid", name="pure-water", amount=50}} },
{"advanced-sleep-capsule",			"effect",			10,		2.0,	"centrifuging",			180.0,	1,		"w-ce-f-ca",	nil,		{{"substance-m", 40}, {"substance-c", 40}, {"advanced-shell-capsule", 3}, {type="fluid", name="pure-water", amount=100}} },

{"simple-neutralizing-capsule",		"effect",			50,		0.5,	"cooking",				80.0,	1,		"w-ce-s-ca",	nil,		{{"food-16-capsule", 6}, {"crystal", 1}, {"basic-shell-capsule", 1}} },
--{"basic-neutralizing-capsule",		"effect",			20,		0.5,	"advanced-cooking",		120.0,	1,		"w-ce-s-cb",	nil,		{{"food-1-capsule", 3}, {"crystal", 5}, {"advanced-shell-capsule", 1}} },
--{"advanced-neutralizing-capsule",		"effect",			10,		0.5,	"centrifuging",			180.0,	1,		"w-ce-s-cc",	nil,		{{"food-1-capsule", 6}, {"crystal", 10}, {"uranium-235", 1}, {"advanced-shell-capsule", 2}} },
{"invulnerability-capsule",			"effect",			10,		4.0,	"centrifuging",			360.0,	1,		"w-ce-r-ca",	nil,		{{"food-1-capsule", 40}, {"advanced-health-buffer-capsule", 1}, {"advanced-regen-capsule", 1}, {type="fluid", name="pure-water", amount=250}} },
}


local function generateFoodCapsule(name, subgroup, file, wrappedEntity, size)
	--local subgroup = subgroup.."-signpost-icons"
	--if not data.raw["item-subgroup"][subgroup] then
	--
	--	subgroups = subgroups + 1
	--	order = 0
	--	
	--	data:extend{{
	--		type = "item-subgroup",
	--		name = subgroup,
	--		group = "signpost-icons",
	--		order = string.rep("a", subgroups)
	--	}}
	--end

	data:extend{
		{
			type = "virtual-signal",
			name = "signpost-icon-"..name,
			--	localised_name = wrappedEntity and {"entity-name."..name} or nil,
			--icon = file or "__attach-notes__/graphics/signpost-icons/"..name.."-icon.png",
			--icon_size = size or 32,
			subgroup = subgroup,
			order = string.rep("a", order),
		}
	}
end


for i, f in pairs(foods) do
	--local sg = "foods"
	local rname = f[1]
	if f[9] then
		rname = f[1].."-"..f[9]
	end
	local iconsize = 64
	--if f[8] then
	--	sg = "effect"
	--else
	--	sg = f[2]
	--end

	-- for icon dir path
	local type = "foods"
	if string.match(f[1], ".+capsule$") then
		type = "capsules"
		--iconsize = 64
	else
		type = "foods"
		--iconsize = 64
	end

	-- add results from table
	local results = {}
	if f[11] ~= nil then
		results = f[11]
	else
		results = {{f[1], f[7]}}
	end

	data:extend({
		{
			type = "capsule",
			name = f[1],
			icon = "__FoodIndustry__/graphics/icons/"..type.."/"..f[1]..".png",
			icon_size = iconsize,

			subgroup = f[2],
			order = f[8],
			stack_size = f[3],
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
					cooldown = f[4]*60,
					range = 0,
					type = "projectile"
				},
				type = "use-on-self"
			},
		},
		

		{
			type = "recipe",
			name = rname,
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/"..type.."/"..f[1]..".png",
			icon_size = iconsize,
			category = f[5],
			subgroup = f[2],
			order = f[8],
			energy_required = f[6],
			ingredients = f[10],
			results = results
		},
	})
end

