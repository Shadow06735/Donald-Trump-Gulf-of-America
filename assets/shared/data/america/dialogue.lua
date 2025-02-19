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

-- ik its the fucking hex cutscene song
local countdownMusicTag = 'hectic'

function onCreate()
    playSound('hectic', 1, countdownMusicTag, true)
end

function onSongStart()
    soundFadeOut(countdownMusicTag, 0.01, 0)
end

function onPause()
    playSound('hectic', 0, countdownMusicTag, true)
end