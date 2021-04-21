--require "stdlib.table"
local table = require('__stdlib__.stdlib.utils.table')


function collect_all_foods_table()
	local all_foods = {}
	
	--table.insert(all_foods, x, y)
	--table.insert(all_foods, x, y)
	all_foods = table.merge(foods_table(),drinks_table(),true)
	
	return all_foods
end


function foods_table()
	local foods = {
	--  1								  2								  3		  4			  5				  6		  7		  8		  9
	--name,								type,							energy,	drinks,	{V,M,C,F},			fullness, c_f,	health,	effect/s
	{"corn",							"vegan-substances1",			3,		-2,		{0,1.6,0,0.8},		24,		24,		-1,		{} },
	{"cucumber",						"vegan-substances1",			5,		4,		{2,2.2,0,-0.2},		20,		20,		7,		{} },
	{"tomato",							"vegan-substances1",			6,		2,		{2.8,1.6,0,-0.2},	16,		16,		8,		{} },
	{"lettuce",							"vegan-substances1",			3,		1,		{1.5,1.1,0,-0.2},	8,		8,		2,		{} },
	{"cooked-corn",						"vegan",						12,		3,		{0,2.4,1.6,0},		26,		26,		10,		{} },
	{"whole-wheat-cookie",				"vegan-fat",					7,		-1.5,	{0,0.7,2.1,0.2},	12,		12,		5,		{} },
	{"bread",							"vegan-fat",					18,		-1,		{0,0.5,2.9,0.7},	33,		33,		20,		{} },
	{"corn-bread",						"vegan-fat",					24,		-2,		{0,0.4,3.4,1.5},	36,		36,		20,		{} },
	{"popcorn",							"vegan-fat",					4,		-3,		{0,0,1.5,2.2},		14,		14,		10,		{} },
	{"basic-salad",						"vegan-gourmet",				17,		6,		{5.6,4.2,0.6,-0.4},	28,		28,		17,		{} },
	{"soy",								"vegan-substances1",			2,		-5,		{0,2.4,1,0.4},		nil,	nil,	nil,	{} },
	{"cooked-soy",						"vegan",						6,		-1,		{0,2,2,1},			5,		5,		5,		{} },
	{"baked-potato",					"vegan-gourmet-substances2",	14,		-1,		{0.4,1.8,2.5,0},	26,		26,		10,		{} },
	{"wheat-grains",					"vegan-substances1",			2,		-5,		{0,0.5,1,0.2},		10,		nil,	nil,	{} },
	{"rapeseed",						"substances1",					1,		-8,		{0,0.4,0.8,1.2},	nil,	nil,	nil,	{} },
	{"fries",							"vegan-fat",					20,		-5,		{0,0,3,4},			55,		0,		30,		{} },
	{"ketchup-fries",					"vegan-fat",					25,		-2,		{0,0,6,6},			70,		0,		45,		{} },
	{"pickles",							"salt-gourmet",					5,		-5,		{1,2,1,0},			6,		0,		5,		{} },
	{"best-salad",						"vegan-gourmet-healthy",		45,		18,		{14,8,6,0},			70,		0,		180,	{} },
	{"tofu",							"vegan",						25,		0,		{3,2,7,5},			60,		0,		15,		{} },
	{"tofu-pizza",						"vegan",						65,		-7,		{1,2,11,7},			95,		0,		70,		{} },
	{"tofu-burger",						"vegan-gourmet",				60,		-8,		{1,2,13,9},			100,	0,		70,		{} },
	--fruit
	{"apple",							"fruit-vegan-substances1",		6,		2,		{1.4,2.1,0,-0.2},	15,		15,		3,		{{"add_more_drinks",0.2,360},} },
	{"apple-peeled",					"fruit-vegan-substances1",		4,		2,		{1.0,1.7,0,-0.2},	14,		14,		2,		{{"add_more_drinks",0.2,240},} },
	{"orange",							"fruit-vegan-substances1",		7,		1,		{2.1,1.1,0,-0.2},	20,		20,		5,		{{"add_more_energy",0.2,180},} },
	{"orange-peeled",					"fruit-vegan-substances1",		5,		1,		{1.7,0.8,0,-0.2},	18,		18,		4,		{{"add_more_energy",0.2,80},} },
	--meat
	{"biter-meat",						"meat-substances1",				10,		-12,	{-0.4,0,2.2,3},		35,		35,		-60,	{} },
	{"cooked-biter-meat",				"meat-substances2",				21,		-6,		{-0.4,0.5,2.2,3.8},	36,		36,		-25,	{} },
	{"biter-steak",						"meat",							30,		-10,	{0,0,6,13},			70,		70,		-15,	{} },
	{"schnitzel",						"meat",							35,		-10,	{0,0,10,15},		80,		80,		-40,	{} },
	{"pizza",							"meat",							70,		-9,		{1,2,6,12},			95,		95,		50,		{} },
	{"burger",							"meat-gourmet",					75,		-10,	{1,1,10,14},		100,	100,	50,		{} },
	-- fishes
	{"fish-caviar-red",					"fish-gourmet-healthy",			51,		-1,		{6.8,0,5.7,3.6},	28,		28,		60,		{} },
	{"fish-meat-red",					"fish-substances1",				12,		-10,	{0,0,2.8,1.5},		30,		30,		-20,	{} },
	{"cooked-fish-meat",				"fish-substances2",				22,		-2,		{0,0,3.5,2.2},		34,		34,		15,		{} },
	{"fish-salad",						"fish",							30,		5,		{4.2,3.8,2.6,0},	48,		48,		25,		{} },
	{"fish-steak",						"fish",							28,		1,		{0,1,3.5,3},		70,		70,		30,		{} },
	{"fish-and-chips",					"fish",							40,		-4,		{0,2,6,5},			65,		65,		45,		{} },
	{"fish-pizza",						"fish",							65,		-1,		{0,2,6,8},			95,		95,		45,		{} },
	{"fish-burger",						"fish-gourmet",					55,		0,		{0,3,5,6},			100,	100,	50,		{} },
	-- species
	{"crystal",							"salt",							10,		-30,	{-1,3,0.5,0},		20,		20,		-5,		{{"drinks_usage",0.4,1800},} },
	{"gelatine-granules",				"fat",							-10,	-20,	{-2,-1.5,2,0.5},	15,		15,		-10,	{{"drinks_usage",1.5,1200},} },
	-- substances
	{"substances-dust",					"special",						-2,		-5,		{-0.2,-0.2,-0.2,-0.2},7,	7,		0,		{} },
	{"substance-v",						"vegan-special",				-5,		-10,	{1,0,0,-0.2},		7,		7,		0,		{} },
	{"substance-m",						"vegan-special",				-5,		-10,	{0,1,0,0},			7,		7,		0,		{} },
	{"substance-c",						"vegan-special",				-5,		-10,	{0,0,1,0},			7,		7,		0,		{} },
	{"substance-f",						"vegan-special",				-5,		-10,	{-0.2,0,0,1},		7,		7,		0,		{} },
	-- food capsules
	{"food-1-capsule",					"special",						408,	-48,	{-5,0,0,0},			100,	100,	200,	{} },
	{"food-12-capsule",					"special",						204,	-24,	{-2.5,0,0,0},		65,		65,		100,	{} },
	{"food-16-capsule",					"special",						68,		-8,		{-0.8,0,0,0},		30,		30,		25,		{} },
	{"simple-food-vmc-capsule",			"vegan-special",				4,		-2,		{3,3,3,0},			12,		12,		0,		{} },
	{"simple-food-vmf-capsule",			"vegan-special",				4,		-2,		{3,3,0,2},			12,		12,		0,		{} },
	{"simple-food-mcf-capsule",			"meat-special",					4,		-2,		{0,3,3,2},			12,		12,		0,		{} },
	{"simple-food-vcf-capsule",			"meat-special",					5,		-2,		{3,0,3,2},			12,		12,		0,		{} },
	{"simple-capsule-pure-water",		"special",						0,		32,		{-0.4,0,0.5,0},		24,		24,		0,		{} },
	{"basic-food-vm-capsule",			"vegan-special",				10,		-5,		{8,8,0,-0.3},		50,		50,		5,		{} },
	{"basic-food-vc-capsule",			"vegan-special",				10,		-5,		{8,0,8,-0.3},		50,		50,		5,		{} },
	{"basic-food-mc-capsule",			"vegan-special",				10,		-5,		{0,8,8,0},			50,		50,		5,		{} },
	{"basic-food-cf-capsule",			"meat-special",					12,		-6,		{-0.4,0,8,7},		60,		60,		7,		{} },
	{"advanced-food-v-capsule",			"vegan-special",				20,		-9,		{18,0,-0.5,-1},		100,	100,	10,		{} },
	{"advanced-food-m-capsule",			"vegan-special",				20,		-9,		{0,18,-0.5,-1},		100,	100,	10,		{} },
	{"advanced-food-c-capsule",			"vegan-special",				20,		-9,		{-1,-0.5,18,0},		100,	100,	10,		{} },
	{"advanced-food-f-capsule",			"meat-special",					25,		-11,	{-1.8,-0.5,0,17},	110,	110,	15,		{} },
	-- effect capsules
	{"simple-speed-capsule",			"special",						5,		-1,		{0,0,1,0},		20,		20,		5,		{{"speed",0.25,10800},} },
	{"simple-crafting-capsule",			"special",						5,		-1,		{1,0,0,0},		20,		20,		5,		{{"crafting",4,4800},} },
	{"simple-mining-capsule",			"special",						5,		-1,		{0,0,1,0},		20,		20,		5,		{{"mining",4,7200},} },
	{"simple-long-reach-capsule",		"special",						5,		-1,		{0,1,0,0},		20,		20,		5,		{{"long_reach",10,54000},} },
	{"basic-speed-capsule",				"special",						20,		0,		{0,0,2,0},		40,		40,		20,		{{"speed",0.5,7200},} },
	{"basic-crafting-capsule",			"special",						20,		0,		{2,0,0,0},		40,		40,		20,		{{"crafting",10,2400},} },
	{"basic-mining-capsule",			"special",						20,		0,		{0,0,2,0},		40,		40,		20,		{{"mining",10,5400},} },
	{"basic-long-reach-capsule",		"special",						20,		0,		{0,2,0,0},		40,		40,		20,		{{"long_reach",80,36000},} },
	{"advanced-speed-capsule",			"special",						40,		0,		{0,0,5,0},		80,		80,		50,		{{"speed",0.75,5400},} },
	{"advanced-crafting-capsule",		"special",						40,		0,		{5,0,0,0},		80,		80,		50,		{{"crafting",50,1200},} },
	{"advanced-mining-capsule",			"special",						40,		0,		{0,0,5,0},		80,		80,		50,		{{"mining",25,3600},} },
	{"advanced-long-reach-capsule",		"special",						40,		0,		{0,5,0,0},		80,		80,		50,		{{"long_reach",150,21600},} },

	{"basic-regen-capsule",				"special",						30,		10,		{0,0,2,1},		50,		50,		25,		{{"regeneration",2,2700},} },
	{"advanced-regen-capsule",			"special",						60,		25,		{0,0,5,3},		80,		80,		50,		{{"regeneration",5,1800},} },
	{"basic-health-buffer-capsule",		"special",						40,		10,		{0,0,0,2},		80,		80,		50,		{{"health_buffer",200,10800},} },
	{"advanced-health-buffer-capsule",	"special",						90,		25,		{0,0,0,5},		110,	110,	100,	{{"health_buffer",1250,2700},} },

	{"simple-digestive-capsule",		"special",						5,		0,		{-0.5,0,0,0},	5,		5,		0,		{{"digestion",0.4,21600},} },
	{"basic-digestive-capsule",			"special",						15,		10,		{-1,2,1,0},		10,		10,		0,		{{"digestion",1,14400},} },
	{"advanced-digestive-capsule",		"special",						35,		20,		{0,3,2,-1},		20,		20,		0,		{{"digestion",3.5,7200},} },
	{"basic-sleep-capsule",				"special",						20,		0,		{0,2,1,0},		10,		10,		0,		{{"sleep",2,5000},} },
	{"advanced-sleep-capsule",			"special",						50,		0,		{0,3,2,-1},		20,		20,		0,		{{"sleep",3,6200},} },
	
	{"simple-neutralizing-capsule",		"special",						0,		0,		{0,0,0,0},		30,		30,		-6,		{{"neutralize_active_effects",0,900},} },
	--{"basic-neutralizing-capsule",	"special",						10,		0,		{-1,-1,-0.5,0},	50,		50,		-20,	{{"",0,0},} },
	--{"advanced-neutralizing-capsule",	"special",						20,		0,		{-2,-2,-1,0},	80,		80,		-50,	{{"",0,0},} },
	{"invulnerability-capsule",			"special",						120,	50,		{-2,-1,5,6},	160,	160,	150,	{{"invulnerability",9750,900},} },
}

	return foods
end


function drinks_table()
	local drinks = {
	--  1								  2							  3		  4		  5					  6		  7		  8		  9
	--name,								type,						energy,	drinks,	{V,M,C,F},			fullness,c_f,	health,	effect/s
	{"flask-pure-water",				"water",					1,		30,		{0,0,0,0},			30,		30,		3,		{} },
	{"plastic-bottle-pure-water",		"water",					0,		60,		{-1,0,0,0},			60,		60,		0,		{} },
	{"glass-bottle-pure-water",			"healthy",					2,		50,		{0,0.8,0,-0.2},		50,		50,		4,		{} },
	
	{"plastic-bottle-apple-juice",		"juice",					5,		55,		{3.4,4.2,0,0},		60,		60,		5,		{} },
	{"glass-bottle-apple-juice",		"juice-healthy",			15,		45,		{6.7,8,0,0},		50,		50,		15,		{} },
	{"paper-package-apple-juice",		"juice-healthy",			25,		35,		{8.2,10.8,-0.4,0},	40,		40,		20,		{} },
	{"plastic-bottle-orange-juice",		"juice",					8,		50,		{4.6,3.7,0,0},		60,		60,		6,		{} },
	{"glass-bottle-orange-juice",		"juice-healthy",			18,		40,		{8.5,6.4,0,-0.3},	50,		50,		17,		{} },
	{"paper-package-orange-juice",		"juice-healthy",			30,		30,		{11.6,9.2,0,-0.8},	40,		40,		24,		{} },
	{"glass-bottle-tomato-juice",		"juice-healthy",			15,		45,		{7.4,9,0,0},		50,		50,		18,		{} },
	{"paper-package-tomato-juice",		"juice-healthy",			20,		40,		{10.2,12,-0.5,0},	40,		40,		25,		{} },
	-- TODO ad new drinks
	{"tea-cup-with-sugar", 				"sweet",					10,		25,		{0,2,1,0},			30,		0,		5,		{{"crafting",1,12000},{"mining",0.5,12000},{"water-usage",-0.02,12000},} },
	{"tea-cup", 						"",							10,		30,		{0,2,0,0},			30,		0,		5,		{{"crafting",1,12000},{"mining",0.5,12000},{"water-usage",-0.02,12000},} },
	{"coffee-cup-with-sugar",			"sweet",					20,		15,		{0,1,2,1},			30,		0,		10,		{{"speed",0.4,18000},{"crafting",2,18000},{"mining",1,18000},{"energy-usage",0.05,18000},} },
	{"coffee-cup", 						"",							20,		20,		{0,1,1,0},			30,		0,		10,		{{"speed",0.4,18000},{"crafting",2,18000},{"mining",1,18000},{"energy-usage",0.05,18000},} },
	}
	
	return drinks
end
