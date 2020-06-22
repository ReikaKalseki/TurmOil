data:extend({ 
	{
		type = "string-setting",
		name = "oil-processing-mode",
		setting_type = "startup",
		default_value = "heavy-with-sulfur",
		allowed_values = {"original", "heavy", "heavy-with-sulfur", "heavy-with-sulfur-lube"},
		order = "r",
	},
	{
		type = "bool-setting",
		name = "flamethrower-ammo",
		setting_type = "startup",
		default_value = true,
		order = "r",
	},
	{
		type = "bool-setting",
		name = "sulfuric-acid",
		setting_type = "startup",
		default_value = false,
		order = "r",
	},
})


