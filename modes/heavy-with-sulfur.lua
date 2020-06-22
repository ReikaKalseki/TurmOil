require("functions")

if Config.oilMode ~= "heavy-with-sulfur" then return end

data.raw.recipe["basic-oil-processing"].emissions_multiplier = 1.5

setOilRecipeInput(100, 0)
setOilRecipeOutput(50)
setAdvOilRecipeOutput(45, 35, 45)

local input = {
	{"electric-engine-unit", 1},
	{"sulfur", 2},
	{"solid-fuel", 4}
}
if Config.acid then
	input[2] = {"sulfuric-acid", 40}
end
setBlueScienceRecipe(input)

forceBlueScienceDependencies({"flammables", "electric-engine", "circuit-network", "sulfur-processing"}, {"advanced-electronics"})

setCrackingAvailabilityWithBasic(true, false)
setSolidFuelTechs("flammables", "flammables", "advanced-oil-processing")
data.raw.technology["lubricant"].prerequisites = {"oil-processing"}

data.raw.technology["plastics"].prerequisites = {"advanced-oil-processing"} --, "chemical-science-pack"

replaceItemInRecipe("sulfur", "petroleum-gas", "heavy-oil", 0.8)
--data.raw.recipe.sulfur.results[1].amount = 3 --from 2

setBlueScienceStatus("flammables", false)
setBlueScienceStatus("electric-engine", false)
setBlueScienceStatus("lubricant", false)

setBlueScienceStatus("plastics", true)
setBlueScienceStatus("explosives", true)
setBlueScienceStatus("advanced-oil-processing", true)
setBlueScienceStatus("advanced-electronics", true)