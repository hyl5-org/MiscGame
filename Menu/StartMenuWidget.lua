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
    self.StartButton.OnClicked:Add(self, self.OnStartButtonClicked)
    self.ExitButton.OnClicked:Add(self, self.OnExitButtonClicked)
    self.OptionButton.OnClicked:Add(self, self.OnOptionButtonClicked)
    -- self.ClickMeCheckBox.OnCheckStateChanged:Add(self, self.OnCheckBoxToggled)

    -- -- 相当于在蓝图中的 Set Timer by Event
    -- self.TimerHandle = UE.UKismetSystemLibrary.K2_SetTimerDelegate({ self, self.OnTimer }, 1, true)
end

function M:Destruct()
    -- 在UMG被销毁时尽量清理已绑定的委托，不清理则会在切换Map时自动清理
    self.StartButton.OnClicked:Remove(self, self.OnStartButtonClicked)
    self.ExitButton.OnClicked:Remove(self, self.OnExitButtonClicked)
    self.OptionButton.OnClicked:Remove(self, self.OnOptionButtonClicked)
    -- self.StartButton.OnClicked:Remove(self, self.OnButtonClicked)
    -- self.ClickMeCheckBox.OnCheckStateChanged:Remove(self, self.OnCheckBoxToggled)

    -- -- 相当于在蓝图中的 Clear and Invalidate Timer by Handle
    -- UE.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.TimerHandle)
end

function M:OnStartButtonClicked()
    
    -- UE.UGameplayStatics.OpenLevel(self:GetWorld(), "Game/Maps/Level1.Level1")
    local widget_class = UE.UClass.Load("/Game/Maps/StartGameWidget.StartGameWidget_C")
    local widget_root = NewObject(widget_class, self)
    widget_root:AddToViewport()
    print("open level")
    local pc = UE.UGameplayStatics.GetPlayerController(self:GetWorld(), 0)
    pc.bShowMouseCursor = false
--     -- --pc:bEnableClickEvents = true
end

function M:OnExitButtonClicked()
    -- UE.UGameplayStatics.OpenLevel(c, ("Game/Maps/Level1.Level1"))
    -- print("quit gae")
    -- UE.UKismetSystemLibrary.QuitGame(self:GetWorld(), SpecificPlayer, QuitPreference, bIgnorePlatformRestrictions)
    -- 弹出确定退出的widget
end

function M:OnOptionButtonClicked()
    -- UE.UGameplayStatics.OpenLevel(self:GetWorld(), ("Game/Maps/Level1.Level1"))
    -- print("open level")

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
