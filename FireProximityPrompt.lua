local function FireProximityPrompt(ProximityPromptObj, n, ShouldSkipHold)
    if ProximityPromptObj.ClassName == "ProximityPrompt" then
        n = n or 1
        local PromptTime = ProximityPromptObj.HoldDuration
        if ShouldSkipHold then
            ProximityPromptObj.HoldDuration = 0
        end
        for i = 1, n do
            ProximityPromptObj:InputHoldBegin()
            if not ShouldSkipHold then
                wait(ProximityPromptObj.HoldDuration)
            end
            ProximityPromptObj:InputHoldEnd()
        end
        ProximityPromptObj.HoldDuration = PromptTime
    else
        error("userdata<ProximityPrompt> expected")
    end
end
