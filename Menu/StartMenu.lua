--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type StartMenu_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

function M:ReceiveBeginPlay()
    -- self.Super.ReceiveBeginPlay(self)
    local pc = UE.UGameplayStatics.GetPlayerController(self:GetWorld(), 0)
    pc.bShowMouseCursor = true
    pc.bEnableClickEvents = true
    local widget_class = UE.UClass.Load("/Game/Maps/StartMenuWidget.StartMenuWidget_C")
    local widget_root = NewObject(widget_class, self)
    widget_root:AddToViewport()
end

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
