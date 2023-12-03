-- character profile
local bag = require("Bag")
local skill = require("Skill")

local Character = {
    level = 1,
    skill = {},
    bag = {},
    hungry = 100,
    thirsty = 100,
    hp = 100,
    energy = 100,
    resume_point = {x=0, y=0, z=0},
}

function Character:new()
    self.bag = bag:new()
end

function Character:interact(item)
    item:tick(self)
end

function Character:bag_insert(item_id, count)
    if self.bag:insert(item_id, count) ~= true then
        UEPrint("failed to insert item to bag", item_id, count, #self.bag.bag_item)
    end
end

function Character:bag_remove(item_id, count)
    if self.bag:remove(item_id, count) ~= true then
         UEPrint("failed to remove item from bag", item_id, count, #self.bag.bag_item)
    end
end

function Character:remove_hp()
end

return Character