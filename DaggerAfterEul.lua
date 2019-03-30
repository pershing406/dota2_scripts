local QuickDagger = {};
local tableName = {"Utility", "Dagger After Eul"};

local myHero = 0;

QuickDagger.optionEnable = Menu.AddOptionBool(tableName, "Enabled", fasle);
QuickDagger.toggleKey = Menu.AddKeyOption(tableName, "Dagger Key", Enum.ButtonCode.KEY_NONE);

function QuickDagger.Init( ... )
    if Engine.IsInGame() then
        myHero = Heroes.GetLocal();
    end
end
QuickDagger.Init();

function QuickDagger.OnGameStart( ... )
    QuickDagger.Init();
end

function QuickDagger.OnUpdate( ... )
    if not Menu.IsEnabled(QuickDagger.optionEnable) then return end;
    if not Engine.IsInGame() then return end; 
    if not myHero then return end; 

    local DaggerItem = NPC.GetItem(myHero, "item_blink");
    if not NPC.HasItem(myHero, "item_blink") then return end; 
    if not Ability.IsReady(DaggerItem) then return end; 

    local PosCursor = Input.GetWorldCursorPos();
    if Menu.IsKeyDown(QuickDagger.toggleKey) then
        Ability.CastPosition(DaggerItem, PosCursor);
    end
end

return QuickDagger;
