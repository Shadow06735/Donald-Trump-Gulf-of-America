playerStrumsVisible()
local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        setProperty('inCutscene', true);
        runTimer('startDialogue', 1);
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end
 
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then -- Timer completed, play dialogue
        startDialogue('dialogue');
    end
end