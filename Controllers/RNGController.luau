local RNGController = {}

RNGController.__index = RNGController

local self = setmetatable({}, RNGController)
self.Rarities = {
	1, -- Legendary
	15, -- Epic
	34, -- Rare
	50 -- Common
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
	for rarity,weight in pairs(self.Rarities) do
		counter += weight
		if randomNumber <= counter then
			if counter == 1 then
				return "Legendary"
			elseif counter == 16 then
				return "Epic"
			elseif counter == 50 then
				return "Rare"
			else
				return "Common"
			end
		end
	end
end

return RNGController
