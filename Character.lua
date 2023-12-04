--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_ThirdPersonCharacter_C
local M = UnLua.Class()

M.bBagOpen = false
M.bagWidget = nil

local BindKey = UnLua.Input.BindKey

function M:Initialize()

end

function M:ReceiveBeginPlay()
    self.bagUI = UE.UClass.Load("/Game/UI/BagUI.BagUI_C")
    self.bagWidget = NewObject(self.bagUI, self)
end

BindKey(M, "B", "Pressed", function(self, Key)
    if not self.bagWidget then print("no bag ui found") return end
    if not self.bBagOpen then
        M:OpenBag()
        self.bBagOpen = true
        print("open bag")
    else
        M:CloseBag()
        self.bBagOpen = false
        print("close bag")
    end
end)

function M:OpenBag()
    self.bagWidget:AddToViewport()
end
function M:CloseBag()
    self.bagWidget:RemoveFromViewport()
end


-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

return M
