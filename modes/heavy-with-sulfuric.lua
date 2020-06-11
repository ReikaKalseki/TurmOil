require("functions")

if Config.oilMode ~= "heavy-with-sulfuric" then return end

data.raw.recipe["basic-oil-processing"].emissions_multiplier = 1.5

setOilRecipeInput(100, 0)
setOilRecipeOutput(60)

setBlueScienceRecipe({
	{"electric-engine-unit", 2},
	{"sulfuric-acid", 40},
	{"solid-fuel", 3}
})

forceBlueScienceDependencies({"flammables", "sulfur-processing", "electric-engine"}, {"advanced-electronics"})

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

setBlueScienceStatus("flammables", false)
setBlueScienceStatus("electric-engine", false)
setBlueScienceStatus("lubricant", false)

setBlueScienceStatus("plastics", true)
setBlueScienceStatus("explosives", true)
setBlueScienceStatus("advanced-oil-processing", true)
setBlueScienceStatus("advanced-electronics", true)
