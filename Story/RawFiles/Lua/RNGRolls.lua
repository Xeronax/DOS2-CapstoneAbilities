local function CreateRoll(chance)
    local Roll = { success = false, resultString = "" }
    local successThreshold = 100 - chance
    local result = math.random(0, 100)

    if result > successThreshold then
        Roll.success = true
        Roll.resultString = "<font color='#2AF413>Success! " .. tostring(result) .. "/" .. tostring(successThreshold) .. "</font>"
    else
        Roll.resultString = "<font color='#ED3434>Fail! " .. tostring(result) .. "/" .. tostring(successThreshold) .. "</font>"
    end
    return Roll
end

local function FirebloodDisarm(target, instigator)
    local polymorph = Osi.CharacterGetAbility(instigator, "Polymorph")
    local chance = 15 + polymorph
    local roll = CreateRoll(chance)
    roll.resultString = "<font color='#F96C26'>Bleed Fire</font> - <font color='#FFC714'>Capstone 3</font>: " .. roll.resultString
    print(roll.resultString)
    if roll.success then
        Osi.ApplyStatus(target, "ATROPHY", 6.0, 0, instigator)
    end
    Osi.CharacterStatusText(instigator, roll.resultString)
end


Ext.Osiris.NewCall(FirebloodDisarm, "XN_Helpers_FirebloodDisarm", "(GUIDSTRING)_Target, (GUIDSTRING)_Instigator")