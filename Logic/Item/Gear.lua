-- gear related logic

-- add buff


-- repair

--

local ItemBase = require("ItemBase")

local bag_size = 30

local Gear = {
    gear_power = 0,
    damage_speed = 1.0
}

function Gear:new()
    setmetatable(Gear, {__index = ItemBase})
end