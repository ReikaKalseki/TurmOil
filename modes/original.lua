require("functions")

if Config.oilMode ~= "original" then return end

setOilRecipeInput(100, 0)
setOilRecipeOutput(30, 30, 40)

setBlueScienceRecipe({
	{"engine-unit", 2},
	{"advanced-circuit", 3},
	{"solid-fuel", 1}
})

forceBlueScienceDependencies({}, {})

setCrackingAvailabilityWithBasic(false, false)
setSolidFuelTechs("advanced-oil-processing", "advanced-oil-processing", "advanced-oil-processing")
data.raw.technology["lubricant"].prerequisites = {"oil-processing"}
data.raw.technology["sulfur-processing"].prerequisites = {"oil-processing"}