local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerControllerModule = require(ReplicatedStorage:WaitForChild("Controllers").TowerController)

local towerController = TowerControllerModule.new()
local chosenTower = towerController:chooseOneOfThem()

print(chosenTower)