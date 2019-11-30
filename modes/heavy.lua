require("functions")

if Config.oilMode ~= "heavy" then return end

data.raw.recipe["basic-oil-processing"].emissions_multiplier = 2.0

setOilRecipeInput(100, 0)
setOilRecipeOutput(50)

setBlueScienceRecipe({
	{"electric-engine-unit", 2},
	{"red-wire", 2},
	{"solid-fuel", 4}
})

forceBlueScienceDependencies({"flammables", "electric-engine", "circuit-network"}, {"advanced-electronics"})

setCrackingAvailabilityWithBasic(true, false)
setSolidFuelTechs("flammables", "flammables", "advanced-oil-processing")
data.raw.technology["lubricant"].prerequisites = {"oil-processing"}

data.raw.technology["plastics"].prerequisites = {"advanced-oil-processing"} --, "chemical-science-pack"