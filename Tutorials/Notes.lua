-- load external module
local Screen = require "Tutorials.Screen"

local M = UnLua.Class()

-- override blueprint event beginplay by add a Receive
-- to call beginplay in blurprint, use self.Overridden.BeginPlay
function M:ReceiveBeginPlay()
    local msg = self:SayHi("陌生人")
    Screen.Print(msg)
end

function M:SayHi(name)

    return  "\n\n" ..
        [[现在我们已经相互熟悉了，这是来自Lua的问候。

        —— 本示例来自 "Content/Script/Tutorials.02_OverrideBlueprintEvents.lua"
    ]]
end

-- receive input, refer to ... for key names
-- https://docs.unrealengine.com/4.26/en-US/API/Runtime/InputCore/EKeys/
-- \Engine\Source\Runtime\InputCore\Classes\InputCoreTypes.h

-- function M:C_Pressed()
--     Screen.Print("one pressed")
-- end

-- advanded input,  UnLua\Plugins\UnLua\Content\Script\UnLua\Input.lua

local BindKey = UnLua.Input.BindKey

BindKey(M, "C", "Pressed", function(self, Key)
    Screen.Print("按下了C")
end)

BindKey(M, "C", "Pressed", function(self, Key)
    Screen.Print("Ctrl + Shift + C")
end, { Ctrl = true, Shift = true })

BindKey(M, "One", "Pressed", function(self, Key)
    self:SpawnActorAndObject()
end, { })

BindKey(M, "Two", "Pressed", function(self, Key)
    self:UnrealNativeContainers()
end, {  })

-- spawn class, actor
-- https://forums.unrealengine.com/t/the-diference-for-spawnactor-and-newobject/398696#:~:text=Basically%2C%20SpawnActor%20is%20used%20for%20creating%20AActor%20based,the%20transform%20and%20add%20to%20Level%E2%80%99s%20actors%E2%80%99%20array.
function M:SpawnActorAndObject()
    Screen.Print("SpawnActorAndObject")
    local World = self:GetWorld()
    local Transform = self.SpawnPointActor:GetTransform()
    local AlwaysSpawn = UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn
    local testActor = UE.UClass.Load("/Game/Core/Blueprints/TestActor.TestActor_C") -- add a _C for class
    -- spawn a new actor
    World:SpawnActor(testActor, Transform, AlwaysSpawn, self, self.Instigator, "Tutorials.TestActor")
    -- create a new uobject
    NewObject(testActor, self, nil, "Tutorials.TestActor")
end


-- native containers
-- local array = TArray({ElementType})
-- local set = TSet({ElementType})
-- local map = TMap({KeyType}, {ValueType})

-- luatype        value            C++ type
-- boolean        true             Boolean
-- number         0                Interger
-- string         ""               String
-- table          FVector          Vector
-- userdata       FVector(1,1,1)   Vector

local function dump_array(array)
    local ret = {}
    for i = 1, array:Length() do
        table.insert(ret, array:Get(i))
    end
    return "[" .. table.concat(ret, ",") .. "]"
end
function M:UnrealNativeContainers()
    Screen.Print("UnrealNativeContainers")
    -- array
    local array = ue.TArray(true)
    local array1 = ue.TArray(1)
    print(dump_array(array), print(dump_array(array1)))
    local array2 = ue.TArray()
    array2:Add("string2")
    print(dump_array(array2))
    array2:Remove("string2")
    print(dump_array(array2))

    -- array:RemoveItem(3)
    -- print("RemoveItem(3):", dump_array(array))

    -- array:Insert(4, 1)
    -- print("Insert(1, 4): ", dump_array(array))

    -- array:Shuffle()
    -- print("Shuffle():    ", dump_array(array))

    -- array:Clear()
    -- print("Clear:        ", dump_array(array))

    -- set
    -- Add
    -- 
    print("========== TSet ==========")
    local set = UE.TSet(0)
    print("New:          ", dump_set(set))

    set:Add(1)
    set:Add(1)
    set:Add(2)
    set:Add(2)
    set:Add(3)
    set:Add(3)
    print("Add:          ", dump_set(set))
    print("Length:       ", set:Length())
    print("Contains(3):  ", set:Contains(3))

    set:Clear()
    print("Clear:        ", dump_set(set))
    -- map
end


return M
