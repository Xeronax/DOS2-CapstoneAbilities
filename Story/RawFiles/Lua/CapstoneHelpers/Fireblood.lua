local HeatingUpBonus = {}

local function HeatUp(character)
    local pyrokinetic = Osi.CharacterGetAbility(character, "FireSpecialist")
    local bonus = math.min(3 + math.floor(pyrokinetic / 2), 7)
    local HeatingUp = Ext.Stats.Get("Stats_XN_Heating_Up")
    if HeatingUpBonus[character] == nil then
        HeatingUpBonus[character] = { stacks = 1, crit = bonus }
    else
        HeatingUpBonus[character].stacks = HeatingUpBonus[character].stacks + 1
        HeatingUpBonus[character].crit = bonus
    end
    HeatingUp.CriticalChance = HeatingUpBonus[character].stacks * HeatingUpBonus[character].crit
    Ext.Stats.Sync("Stats_XN_Heating_Up")
    Osi.ApplyStatus(character, "HEATING_UP", -1.0, 0, character)
end

local function InnerWarmth(character)
    local stacks = HeatingUpBonus[character].stacks
    local polymorph = Osi.CharacterGetAbility(character, "Polymorph")
    local pointsPerStack = math.min(7, 4 + polymorph)
    local maxVitality = NRD_CharacterGetStatInt(character, "MaxVitality")
    local heal = 6 + math.ceil(0.05 * maxVitality)
    HeatingUpBonus[character].stacks = 0
    Osi.RemoveStatus(character, "HEATING_UP")
    if polymorph < 3 then
        return
    end
    local InnerWarmthInstance = Ext.Stats.Get("Stats_XN_Inner_Warmth")
    InnerWarmthInstance.Armor = stacks * pointsPerStack
    InnerWarmthInstance.MagicArmor = stacks * pointsPerStack
    Ext.Stats.Sync("Stats_XN_Inner_Warmth")
    Osi.ApplyStatus(character, "INNER_WARMTH", 6, 0, character)
    ApplyCustomHeal(character, heal)
end

Ext.Osiris.NewCall(HeatUp, "XN_Helpers_HeatUp", "(GUIDSTRING)_Target");
Ext.Osiris.NewCall(InnerWarmth, "XN_Helpers_InnerWarmth", "(GUIDSTRING)_Target")