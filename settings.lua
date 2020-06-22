data:extend({ 
	{
		type = "string-setting",
		name = "oil-processing-mode",
		setting_type = "startup",
		default_value = "heavy-with-sulfuric",
		allowed_values = {"original", "heavy", "heavy-with-sulfur", "heavy-with-sulfuric", "heavy-with-sulfur-lube", "heavy-with-sulfuric-lube"},
		order = "r",
	},
	{
		type = "bool-setting",
		name = "flamethrower-ammo",
		setting_type = "startup",
		default_value = true,
		order = "r",
	},
})


