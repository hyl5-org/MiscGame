local world_level = {
    
}

SEASON = {
    "SPRING",
    "SUMMER",
    "AUTUMN",
    "WINTER"
}

local world_stat = {
    -- season, day / time
    time = {season = SEASON[1], day = 0, time = 0.0},
    -- world tier, higher means more difficult enemis
    tier = 1
}

-- set world tier
function world_stat:set_tier(x)
    self.tier = x
end

return world_stat