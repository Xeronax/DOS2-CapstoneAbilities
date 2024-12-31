local Character

local Descriptions = {}
Descriptions["Target_Fireblood"] = function(paramName)
    if(paramName == "HeatingUpBonus") then
        return tostring(math.min(3 + math.floor(Character.FireSpecialist / 2), 7))
    elseif(paramName == "InnerWarmthHeal") then
        return tostring(6 + math.ceil(0.05 * Character.MaxVitality))
    elseif (paramName == "InnerWarmthArmor") then
        return tostring(math.min(7, 4 + Character.Polymorph))
    end
    return nil
end

Ext.Events.StatusGetDescriptionParam:Subscribe(function (event)
    Character = event.Character
    print(event.Status.Name)
    if(Descriptions[event.Status.Name]) then
        local parameterName = event.Params[1]
        event.Description = Descriptions[event.Status.Name](parameterName)
    end
end )

Ext.Events.SkillGetDescriptionParam:Subscribe(function (event)
    Character = event.Character
    if(Descriptions[event.Skill.Name]) then
        local parameterName = event.Params[1]
        event.Description = Descriptions[event.Skill.Name](parameterName)
    end
end )
