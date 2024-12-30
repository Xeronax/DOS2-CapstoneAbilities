local function ArrayContains(arr, val)
    for i = 1, #arr do
        if (arr[i] == val) then
            return true
        end
    end
    return false
end



local function Subtract(a, b)
    -- print("Subtracting ", b, " from ", a, " = ", a - b)
    return a - b
end

local function DamageSourceIsDirect(src)
    local directDamageSources = { "Attack", "Offhand" }
    if ArrayContains(directDamageSources, src) then
        return 1
    else
        return 0
    end
end

local function ApplyCustomHeal(character, amount)
    if amount < 1 then
        amount = 1
    end
    Ext.Stats.SetAttribute("XN_Heal", "HealValue", amount)
    Ext.Stats.Sync("XN_Heal")
    Osi.ApplyStatus(character, "XN_Heal", 0.0, 0, character)
end

local function SkillRequiresSchool(skillId, school)
    local extracted = skillId:match("^(.-_.-)_")
    if extracted == nil then
        return 0
    end
    local skillData = Ext.Stats.Get(extracted)
    for _, requirementTable  in pairs(skillData.MemorizationRequirements) do
        if requirementTable.Requirement == school then
            return 1
        end
    end
    return 0
end

print("Adding Utils to story headers...")
Ext.Osiris.NewQuery(Subtract, "XN_Utils_Subtract", "[in](REAL)_A, [in](REAL)_B, [out](REAL)_Result");
Ext.Osiris.NewQuery(DamageSourceIsDirect, "XN_Utils_DamageSourceIsDirect", "[in](STRING)_Source, [out](INTEGER)_Result");
Ext.Osiris.NewQuery(SkillRequiresSchool, "XN_Utils_SkillRequiresSchool", "[in](STRING)_SkillID, [in](STRING)_School, [out](INTEGER)_Result");

Ext.Osiris.NewCall(ApplyCustomHeal, "XN_Utils_ApplyCustomHeal", "(GUIDSTRING)_Character, (INTEGER)_Amount");