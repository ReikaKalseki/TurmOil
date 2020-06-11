require "__DragonIndustries__.arrays"
require "__DragonIndustries__.mathhelper"
require "__DragonIndustries__.recipe"
require "__DragonIndustries__.tech"

function setBlueScienceStatus(tech, has)
	if has then
		addSciencePackToTech(tech, "chemical-science-pack")
	else
		removeSciencePackFromTech(tech, "chemical-science-pack")
	end
end

function setOilRecipeInput(crude, water)
	local rec = data.raw.recipe["basic-oil-processing"]
	
	rec.ingredients = {
		{type="fluid", name="water", amount=water and water or 0},
		{type="fluid", name="crude-oil", amount=crude and crude or 0}
    }
end

function setOilRecipeOutput(heavy, light, gas)
	local rec = data.raw.recipe["basic-oil-processing"]
	
	rec.results = {
		{type="fluid", name="heavy-oil", amount=heavy and heavy or 0},
		{type="fluid", name="light-oil", amount=light and light or 0},
		{type="fluid", name="petroleum-gas", amount=gas and gas or 0}
	}
end

function setBlueScienceRecipe(items)
	local rec = data.raw.recipe["chemical-science-pack"]
	
	rec.ingredients = {}
	
	for _,entry in pairs(items) do
		local parsed = parseIngredient(entry)
		local val = {type = "item", name = parsed[1], amount = parsed[2]}
		if data.raw.fluid[val.name] then
			val.type = "fluid"
			if rec.category == nil or rec.category == "crafting" then
				rec.category = "crafting-with-fluid"
			end
		end
		table.insert(rec.ingredients, val)
	end
end

function forceBlueScienceDependencies(include, exclude)
	local tech = data.raw.technology["chemical-science-pack"]
	
	local cp = table.deepcopy(tech.prerequisites)
	tech.prerequisites = {}
	
	for _,dep in pairs(cp) do
		if not listHasValue(exclude, dep) then
			table.insert(tech.prerequisites, dep)
		end
	end
	
	for _,dep in pairs(include) do
		if not listHasValue(tech.prerequisites, dep) then
			table.insert(tech.prerequisites, dep)
		end
	end
end

function setSolidFuelTechs(heavy, light, gas)
	for name,tech in pairs(data.raw.technology) do
		removeTechUnlock(name, "solid-fuel-from-heavy-oil")
		removeTechUnlock(name, "solid-fuel-from-light-oil")
		removeTechUnlock(name, "solid-fuel-from-petroleum-gas")
	end
	
	addTechUnlock(heavy, "solid-fuel-from-heavy-oil")
	addTechUnlock(light, "solid-fuel-from-light-oil")
	addTechUnlock(gas, "solid-fuel-from-petroleum-gas")
end

local function clearCrackingUnlocks(recipe)
	removeTechUnlock("oil-processing", recipe)
	removeTechUnlock("advanced-oil-processing", recipe)
end

function setCrackingAvailabilityWithBasic(h2l, l2g)
	clearCrackingUnlocks("heavy-oil-cracking")
	clearCrackingUnlocks("light-oil-cracking")
	if h2l then		
		addTechUnlock("oil-processing", "heavy-oil-cracking")
	else
		addTechUnlock("advanced-oil-processing", "heavy-oil-cracking")
	end
	if l2g then
		addTechUnlock("oil-processing", "light-oil-cracking")
	else
		addTechUnlock("advanced-oil-processing", "light-oil-cracking")
	end
end