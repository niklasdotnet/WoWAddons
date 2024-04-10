AutoScript = {}

------------------------------------------------------------------------------------

function AutoRole:RunScript()
    ObjectiveTracker_Collapse()
end

------------------------------------------------------------------------------------

local function AutoScript_EventHandler(self, event, ...)
    -- event: PLAYER_ENTERING_WORLD, ACTIVE_TALENT_GROUP_CHANGED
    AutoScript:RunScript();
end

------------------------------------------------------------------------------------

local AutoScript_EventFrame = CreateFrame("Frame");

AutoScript_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
AutoScript_EventFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
AutoScript_EventFrame:SetScript("OnEvent", AutoScript_EventHandler);
