local ItemBase = require("ItemBase")

local bag_size = 30

local Bag = {
    bag_item = {},
}

function Bag:new()
    setmetatable(Bag, {__index = ItemBase})
end

-- insert an item to bag
function Bag:insert(item_id, count)
    if #self.bag_item >= bag_size then
        return false
    end
    self.bag_item[item_id] = self.bag_item[item_id] + count
    return true
end

function Bag:remove(item_id, count)
    if self.bag_item[item_id] and self.bag_item[item_id] >= count then
        self.bag_item[item_id] = self.bag_item[item_id] - count
        if self.bag_item[item_id] == 0 then
            table.remove(self.bag_item, item_id)
        end
        return true
    else
        return false
    end
end

return Bag