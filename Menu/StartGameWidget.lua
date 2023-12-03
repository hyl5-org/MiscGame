--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type StartMenuWidget_C
local M = UnLua.Class()

function M:Construct()
    self.BackButton.OnClicked:Add(self, self.OnBackButtonClicked)
    print("bind")
end

function M:Destruct()
    -- 在UMG被销毁时尽量清理已绑定的委托，不清理则会在切换Map时自动清理
    self.BackButton.OnClicked:Remove(self, self.OnBackButtonClicked)
    print("unbind")
end

function M:OnBackButtonClicked()
    print("back to startmenu")
    self:RemoveFromViewport()
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
