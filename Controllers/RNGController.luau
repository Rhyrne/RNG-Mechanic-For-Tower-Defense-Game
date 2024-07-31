local RNGController = {}

RNGController.__index = RNGController

local self = setmetatable({}, RNGController)
self.Rarities = {
	{ weight = "1", name = "Legendary" },
	{ weight = "15", name = "Epic" },
	{ weight = "34", name = "Rare" },
	{ weight = "50", name = "Common" }
}

function RNGController.randomNumberGenerator(lengthOfTable)
	local randomNumber = math.random(1,lengthOfTable)
	return randomNumber
end

function RNGController.chooseByRarity(tableOfItems)
	local rarityOfChosen = RNGController.chooseRarity()
	print(rarityOfChosen)
	local similarRarityItems = RNGController.getByRarity(tableOfItems, rarityOfChosen)
	print(similarRarityItems)
	
	local chosenNumber = RNGController.randomNumberGenerator(#similarRarityItems)
	print(chosenNumber)
	return similarRarityItems[chosenNumber]
end

function RNGController.getByRarity(tableOfItems, rarityOfChosen)
	local rarityTable = {}
	
	for index, item in tableOfItems do
		if item.rarity == rarityOfChosen  then
			table.insert(rarityTable, index)
		end
	end
	return rarityTable
end

function RNGController.chooseRarity()
	local randomNumber = math.random(1,100)
	local counter = 0
	
	for _,rarity in pairs(self.Rarities) do
		counter += rarity.weight
		if randomNumber <= counter then
			return rarity.name
		end
	end
end

return RNGController
