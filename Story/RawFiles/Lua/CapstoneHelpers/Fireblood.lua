local function HeatUp(character)
    local pyrokinetic = Osi.CharacterGetAbility(character, "FireSpecialist")
    local bonus = 5 + pyrokinetic
    Ext.Stats.SetAttribute("Stats_XN_Heating_Up", "CriticalChance", bonus)
    Ext.Stats.Sync("Stats_XN_Heating_Up")
    Osi.ApplyStatus(character, "HEATING_UP", -1.0, 0, character)
end

Ext.Osiris.NewCall(HeatUp, "XN_Helpers_HeatUp", "(GUIDSTRING)_Target");