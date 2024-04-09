AutoRole = {}

------------------------------------------------------------------------------------

function AutoRole:SetSpec()
    -- Declare local variables
    local specName = "Unknown";
    local maxPoints = 0
    local maxPointsTab = 0

    -- Get the number of talent tabs
    local numTabs = GetNumTalentTabs();

    -- Loop through talent tabs
    for i = 1, numTabs do
        local _, _, pointsSpent, _ = GetTalentTabInfo(i);
        -- If this tab has more talent points spent than the current max, update max
        if pointsSpent > maxPoints then
            maxPoints = pointsSpent
            maxPointsTab = i
        end
    end

    -- Obtain specialization name from the tab with the most talent points spent
    local name, _, _, _ = GetTalentTabInfo(maxPointsTab);
    specName = name;

    print("AutoRole: Specialization Name is " .. specName);

    -- Set role based on specialization
    if specName == "Protection" or specName == "Guardian" then
        print("AutoRole: Setting Role TANK");
        SetRole("TANK");
    elseif specName == "Holy" or specName == "Restoration" or specName == "Discipline" then
        print("AutoRole: Setting Role HEALER");
        SetRole("HEALER");
    else
        if specName == "Unknown" then
            print("AutoRole: Setting Default Role DAMAGE");
        else
            print("AutoRole: Setting Role DAMAGE");
        end
        SetRole("DAMAGER");
    end
end

------------------------------------------------------------------------------------

local function AutoRole_EventHandler(self, event, ...)
    -- event: PLAYER_ENTERING_WORLD, ACTIVE_TALENT_GROUP_CHANGED
    AutoRole:SetSpec();
end

------------------------------------------------------------------------------------

local AutoRole_EventFrame = CreateFrame("Frame");

AutoRole_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
AutoRole_EventFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
AutoRole_EventFrame:SetScript("OnEvent", AutoRole_EventHandler);
