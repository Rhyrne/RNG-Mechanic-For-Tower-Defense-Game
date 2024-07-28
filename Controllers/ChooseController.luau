local replicatedStorage = game:GetService("ReplicatedStorage")
local RNGController = require(replicatedStorage.Controllers.RNGController)
local tableModule = require(replicatedStorage.ConfigureModules.TableModule)

local TowerController = {}
TowerController.__index = TowerController

function TowerController.new()
	local self = setmetatable({}, TowerController)
	self.towers = {
		{name = "WaterTower", rarity = "Legendary"},
		{name = "FireTower", rarity = "Epic"},
		{name = "EarthTower", rarity = "Rare"},
		{name = "AirTower", rarity = "Common"},
		{name = "LavaTower", rarity = "Legendary"},
		{name = "SpaceTower", rarity = "Epic"},
		{name = "MoonTower", rarity = "Rare"},
		{name = "IceTower", rarity = "Common"}
	}
	
	self.chosenTowers = {}
	return self
end

function TowerController:chooseOneOfThem()
	local chosenNumber = RNGController.chooseByRarity(self.towers)
	local chosenTower = self.towers[chosenNumber]
	
	tableModule.MoveAndDelete(self.towers,chosenNumber,self.chosenTowers)
	
	return chosenTower
end

return TowerController