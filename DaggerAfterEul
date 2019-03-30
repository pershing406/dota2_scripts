local Test = {};

local tableName = {"Utility", "Dagger After Eul"};

local myHero = 0;

Test.optionEnable = Menu.AddOptionBool(tableName, "Enable", fasle);
Test.toggleKey = Menu.AddKeyOption(tableName, "Dagger Key", Enum.ButtonCode.KEY_NONE);

function Test.OnScriptLoad( ... )
    Log.Write("Script Loaded!");
    Log.Write(myHero);
end
-------------------------------------
function Test.Init( ... )
    if Engine.IsInGame() then
        myHero = Heroes.GetLocal();
    end
end
Test.Init();

function Test.OnGameStart( ... )
    Test.Init();
end
-------------------------------------

function Test.OnUpdate( ... )
    if not Menu.IsEnabled(Test.optionEnable) then return end; -- включено ли меню
    if not Engine.IsInGame() then return end; -- запущена ли игра
    if not myHero then return end; -- объект героя

    local DaggerItem = NPC.GetItem(myHero, "item_blink"); -- получение объекта блинка
    if not NPC.HasItem(myHero, "item_blink") then return end; -- есть ли блинк в инвентаре
    if not Ability.IsReady(DaggerItem) then return end; -- готов ли к применению блинк

    local PosCursor = Input.GetWorldCursorPos();
    if Menu.IsKeyDown(Test.toggleKey) then
        Ability.CastPosition(DaggerItem, PosCursor);
    end
end

return Test;
