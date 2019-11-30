require("functions")

if Config.oilMode ~= "heavy-with-sulfur" then return end

data.raw.recipe["basic-oil-processing"].emissions_multiplier = 1.5

setOilRecipeInput(100, 0)
setOilRecipeOutput(60)

setBlueScienceRecipe({
	{"electric-engine-unit", 2},
	{"sulfur", 4},
	{"solid-fuel", 3}
})

forceBlueScienceDependencies({"flammables", "electric-engine"}, {"advanced-electronics"})

setCrackingAvailabilityWithBasic(true, false)
setSolidFuelTechs("flammables", "flammables", "advanced-oil-processing")
data.raw.technology["lubricant"].prerequisites = {"oil-processing"}

data.raw.technology["sulfur-processing"].prerequisites = {"lubricant"}
data.raw.technology["explosives"].prerequisites = {"lubricant"}
--breaks things data.raw.recipe["sulfur"] = nil
removeTechUnlock("sulfur-processing", "sulfur")
addRecipeProduct("lubricant", "sulfur", 6)

data.raw.item.sulfur.fuel_category = "chemical"
data.raw.item.sulfur.fuel_value = "600kJ"
data.raw.item.sulfur.fuel_emissions_multiplier = 12
data.raw.item.sulfur.fuel_acceleration_multiplier = 0.3

data.raw.technology["plastics"].prerequisites = {"advanced-oil-processing"} --, "chemical-science-pack"
