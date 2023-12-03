local ItemBase = {
    item_id = 0,
    item_weight = 0.0,
    item_type = "",
    item_description = "",
}

-- function Account:new (o)
--     o = o or {}
--     setmetatable(o, self)
--     self.__index = self
--     return o
-- end

-- function Account:deposit (v)
--     self.balance = self.balance + v
-- end

-- function Account:withdraw (v)
--     if v > self.balance then error"insufficient funds" end
--     self.balance = self.balance - v
-- end
return ItemBase