require("functions")

if Config.oilMode ~= "heavy" then return end

if mods["aai-industry"] then error("This oil processing configuration is not compatible with AAI industry, as that mod makes blue science dependent on plastic and advanced circuits. Choose 'original' or uninstall one of the two mods.") end

data.raw.recipe["basic-oil-processing"].emissions_multiplier = 2.0

setOilRecipeInput(100, 0)
setOilRecipeOutput(50)

setBlueScienceRecipe({
	{"electric-engine-unit", 2},
	{"red-wire", 2},
	{"solid-fuel", 4}
})

forceBlueScienceDependencies({"flammables", "electric-engine", "circuit-network"}, {"sulfur-processing", "advanced-electronics"})

setCrackingAvailabilityWithBasic(true, false)
setSolidFuelTechs("flammables", "flammables", "advanced-oil-processing")
data.raw.technology["lubricant"].prerequisites = {"oil-processing"}

data.raw.technology["plastics"].prerequisites = {"advanced-oil-processing"} --, "chemical-science-pack"

setBlueScienceStatus("flammables", false)
setBlueScienceStatus("electric-engine", false)
setBlueScienceStatus("lubricant", false)

setBlueScienceStatus("sulfur-processing", true)
setBlueScienceStatus("plastics", true)
setBlueScienceStatus("explosives", true)
setBlueScienceStatus("advanced-oil-processing", true)
setBlueScienceStatus("advanced-electronics", true)