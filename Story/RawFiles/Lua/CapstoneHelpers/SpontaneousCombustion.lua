local function SpreadFire(characterGUID)
    local burningDuration
    local necrofireDuration
    if(Osi.HasActiveStatus(characterGUID, "BURNING") > 0) then
        burningDuration = Osi.GetStatusTurns(characterGUID, "BURNING")
    end
    print("Burning duration: ", burningDuration)
    if(Osi.HasActiveStatus(characterGUID, "NECROFIRE") > 0) then
        necrofireDuration = Osi.GetStatusTurns(characterGUID, "NECROFIRE")
    end
    print("Necrofire duration: ", necrofireDuration)
    local charactersInCombat = Ext.GetAllTeams()
    for k, v in charactersInCombat do
        print(k, ": ", v)
    end
end

Ext.Osiris.NewCall(SpreadFire, "XN_Helpers_SpreadFireAndNecrofire", "(CHARACTERGUID)_Target")