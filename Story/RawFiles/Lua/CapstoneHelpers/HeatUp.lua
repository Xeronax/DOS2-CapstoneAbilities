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

Ext.Osiris.NewCall(HeatUp, "XN_Helpers_HeatUp", "(CHARACTERGUID)_Character")