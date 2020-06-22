require "config"

require "modes.original"
require "modes.heavy"
require "modes.heavy-with-sulfur"
require "modes.heavy-with-sulfuric"

require "__DragonIndustries__.recipe"

if Config.flameAmmo then
	data.raw.recipe["flamethrower-ammo"].ingredients = {
		{type="item", name="steel-plate", amount=5},
		{type="fluid", name="light-oil", amount=50},
		{type="fluid", name="heavy-oil", amount=50}
	}
end