data:extend({
    {
        type = "int-setting",
        name = "food-industry-padding",
        setting_type = "runtime-per-user",
        default_value = 0,
		minimum_value = -4000,
		maximum_value = 4000
    },
	{
        type = "bool-setting",
        name = "food-industry-bottom",
        setting_type = "runtime-per-user",
        default_value = false
    },
	{
        type = "int-setting",
        name = "food-industry-hunger-speed",
        setting_type = "runtime-global",
        default_value = 100,
		minimum_value = 10,
		maximum_value = 1000,
    },
	{
        type = "int-setting",
        name = "food-industry-drinks-modifier",
        setting_type = "runtime-global",
        default_value = 30,
		minimum_value = 1,
		maximum_value = 100,
    },
	{
        type = "int-setting",
        name = "food-industry-substances-modifier",
        setting_type = "runtime-global",
        default_value = 30,
		minimum_value = 1,
		maximum_value = 100,
    },
	{
        type = "double-setting",
        name = "food-industry-slots",
        setting_type = "runtime-global",
        default_value = 0.1,
		minimum_value = 0,
		maximum_value = 10,
    },
	{
        type = "double-setting",
        name = "food-industry-durability",
        setting_type = "runtime-global",
        default_value = 0.25,
		minimum_value = 0,
		maximum_value = 50,
    },
	{
        type = "bool-setting",
        name = "food-industry-remove-meat",
        setting_type = "runtime-global",
        default_value = true
    },
	{
        type = "bool-setting",
        name = "food-industry-disassembly-recipes",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "food-industry-calculate",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "int-setting",
        name = "food-industry-effects-update",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 30,
    },
    {
        type = "int-setting",
        name = "food-industry-substances-update",
        setting_type = "runtime-global",
        default_value = 48,
        minimum_value = 1,
        maximum_value = 300,
    },
    {
        type = "bool-setting",
        name = "food-industry-debug-gui",
        setting_type = "runtime-per-user",
        default_value = false
    },
})