local originalXPositions = {}
local originalYPositions = {}
local leftRotation = 0
local downRotation = 0
local upRotation = 0
local rightRotation = 0

--functions and shit
function fuckYou()
    for i = 0, 3 do
        local playerIndex = i + 4
        local opponentX = getPropertyFromGroup('strumLineNotes', i, 'x')
        local playerX = getPropertyFromGroup('strumLineNotes', playerIndex, 'x')

        noteTweenX('swapOpponentX'..i, i, playerX, 0.4, 'quartInOut')
        noteTweenX('swapPlayerX'..i, playerIndex, opponentX, 0.4, 'quartInOut')
    end
end

function nevermind()
    for i = 0, 3 do
        local playerIndex = i + 4
        local opponentX = originalXPositions[i + 1]
        local playerX = originalXPositions[playerIndex + 1]

        noteTweenX('returnOpponentX'..i, i, opponentX, 0.4, 'quartInOut')
        noteTweenX('returnPlayerX'..i, playerIndex, playerX, 0.4, 'quartInOut')
    end
end

function goBackX()
--for reference, original position is 50
    for i = 0, 3 do
        local playerIndex = i + 4
        local opponentX = originalXPositions[i + 1]
        local playerX = originalXPositions[playerIndex + 1]

        noteTweenX('returnOpponentX'..i, i, opponentX, 0.1, 'quartInOut')
        noteTweenX('returnPlayerX'..i, playerIndex, playerX, 0.1, 'quartInOut')
    end
end

function goBackY()
    if downscroll then
        noteTweenY('oppo0', 0, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('oppo1', 1, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('oppo2', 2, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('oppo3', 3, screenHeight - 150, 0.1, 'quartInOut')
        noteTweenY('play0', 4, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('play1', 5, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('play2', 6, screenHeight - 150, 0.1, 'quartInOut')
	    noteTweenY('play3', 7, screenHeight - 150, 0.1, 'quartInOut')
    else
        noteTweenY('oppo0', 0, 50, 0.1, 'quartInOut')
	    noteTweenY('oppo1', 1, 50, 0.1, 'quartInOut')
	    noteTweenY('oppo2', 2, 50, 0.1, 'quartInOut')
	    noteTweenY('oppo3', 3, 50, 0.1, 'quartInOut')
        noteTweenY('play0', 4, 50, 0.1, 'quartInOut')
	    noteTweenY('play1', 5, 50, 0.1, 'quartInOut')
	    noteTweenY('play2', 6, 50, 0.1, 'quartInOut')
	    noteTweenY('play3', 7, 50, 0.1, 'quartInOut')
    end
end

function funnyMove1()
    if downscroll then
        noteTweenY('oppodown1', 1, screenHeight - 50, 0.1, 'quartInOut')
        noteTweenY('oppoup2', 2, screenHeight - 250, 0.1, 'quartInOut')
        noteTweenY('playdown1', 5, screenHeight - 50, 0.1, 'quartInOut')
        noteTweenY('playup2', 6, screenHeight - 250, 0.1, 'quartInOut')
    else
        noteTweenY('oppodown1', 1, 150, 0.1, 'quartInOut')
        noteTweenY('oppoup2', 2, -50, 0.1, 'quartInOut')
        noteTweenY('playdown1', 5, 150, 0.1, 'quartInOut')
        noteTweenY('playup2', 6, -50, 0.1, 'quartInOut')
    end
end

function funnyMove2()
    if middlescroll then
        noteTweenX('oppoleft1', 0, -18, 0.1, 'quartInOut') -- original: 82
        noteTweenX('opporight2', 3, 1183, 0.1, 'quartInOut') -- original: 1083
        noteTweenX('playleft1', 4, 312, 0.1, 'quartInOut') -- original: 412
        noteTweenX('playright2', 7, 848, 0.1, 'quartInOut') -- original: 748
    else
        noteTweenX('oppoleft1', 0, -50, 0.1, 'quartInOut')
        noteTweenX('opporight2', 3, 486, 0.1, 'quartInOut')
        noteTweenX('playleft1', 4, 590, 0.1, 'quartInOut')
        noteTweenX('playright2', 7, 1126, 0.1, 'quartInOut')
    end
end

function funnyTilt()
    local angleshit = 50
    local anglevar = 5

    if curBeat % 2 == 0 then
        angleshit = anglevar
    else
        angleshit = -anglevar
    end

    setProperty('camHUD.angle', angleshit)
    doTweenAngle('turnGame', 'camGame', angleshit, 1, 'circOut')
    triggerEvent("Add Camera Zoom", 0, 0.3)
end

function resetFunnyTilt()
    doTweenAngle('turnGame', 'camGame', 0, 0.1, 'circOut')
    setProperty('camHUD.angle', 0)
end

function funnyZoom()
    triggerEvent("Add Camera Zoom", 0.3, 0)
end

function funnySpin(elapsed)
    local funnySpinActive = false
    local spinSpeed = 500
    local radius = 30
    local time = (getSongPosition() / 1000) * spinSpeed
    local verticalAmplitude = 30
    local verticalSpeed = 4

    for i = 0, 7 do
        local angle = time + (i * 45)
        local radians = math.rad(angle)

        local newX = originalXPositions[i + 1] + math.cos(radians) * radius
        local newY = originalYPositions[i + 1] + math.sin(radians) * radius

        local verticalOffset = math.sin((getSongPosition() / 1000) * verticalSpeed * math.pi) * verticalAmplitude
        newY = newY + verticalOffset

        setPropertyFromGroup('strumLineNotes', i, 'x', newX)
        setPropertyFromGroup('strumLineNotes', i, 'y', newY)
    end
end

function arrowRotate()

    leftRotation = leftRotation + 90
    setPropertyFromGroup('playerStrums', 0, 'angle', leftRotation)
    setPropertyFromGroup('opponentStrums', 0, 'angle', leftRotation)
        
    downRotation = downRotation + 90
    setPropertyFromGroup('playerStrums', 1, 'angle', downRotation)
    setPropertyFromGroup('opponentStrums', 1, 'angle', downRotation)
        
    upRotation = upRotation + 90
    setPropertyFromGroup('playerStrums', 2, 'angle', upRotation)
    setPropertyFromGroup('opponentStrums', 2, 'angle', upRotation)
        
    rightRotation = rightRotation + 90
    setPropertyFromGroup('playerStrums', 3, 'angle', rightRotation)
    setPropertyFromGroup('opponentStrums', 3, 'angle', rightRotation)
end

function cancelArrowRotate()
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'angle', 0)
        setPropertyFromGroup('opponentStrums', i, 'angle', 0)
    end
    leftRotation = 0
    downRotation = 0
    upRotation = 0
    rightRotation = 0
end

function noNotes4u()
    noteTweenAlpha('byebyeoppo0', 0, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeoppo1', 1, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeoppo2', 2, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeoppo3', 3, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeplay0', 4, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeplay1', 5, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeplay2', 6, 0, 0.25, 'quartInOut')
    noteTweenAlpha('byebyeplay3', 7, 0, 0.25, 'quartInOut')
end

function returnPlayerNotes()
    noteTweenAlpha('welcomeoldplay0', 4, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldplay1', 5, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldplay2', 6, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldplay3', 7, 1, 0.25, 'quartInOut')
end

function returnOpponentNotes()
    noteTweenAlpha('welcomeoldoppo0', 0, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldoppo1', 1, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldoppo2', 2, 1, 0.25, 'quartInOut')
    noteTweenAlpha('welcomeoldoppo3', 3, 1, 0.25, 'quartInOut')
end

--the actual modchart
function onCreate()
    leftRotation = 0
    downRotation = 0
    upRotation = 0
    rightRotation = 0
end

function onSongStart()
    for i = 0, 7 do
        table.insert(originalXPositions, getPropertyFromGroup('strumLineNotes', i, 'x'))
        table.insert(originalYPositions, getPropertyFromGroup('strumLineNotes', i, 'y'))
    end
end

function onBeatHit()
    if curBeat == 16 or curBeat == 160 then
        funnySpinActive = true
    end
    if curBeat >= 32 and curBeat < 96 or curBeat >= 160 and curBeat < 288 then
        funnyTilt()
    elseif curBeat == 96 then
        resetFunnyTilt()
        cancelArrowRotate()
        goBackX()
        goBackY()
        funnySpinActive = false
    end
    if curBeat == 224 then
        showOnlyStrums()
        noNotes4u()
    end
    if curBeat == 239 then
        returnPlayerNotes()
    end
    if curBeat == 255 then
        goBackX()
        goBackY()
        returnOpponentNotes()
        funnySpinActive = false
    end
    if curBeat == 288 then
        resetFunnyTilt()
        cancelArrowRotate()
        showOnlyStrums(false)
    end
    if curBeat >= 160 and curBeat < 288 then
        funnyZoom()
    end
    if curBeat >= 64 and curBeat < 96 or curBeat >= 192 and curBeat < 288 then
        arrowRotate()
    end
    if curBeat == 256 or curBeat == 258 or curBeat == 260 or curBeat == 262 or curBeat == 264 or curBeat == 266 or curBeat == 268 or curBeat == 270 or curBeat == 272 or curBeat == 274 or curBeat == 276 or curBeat == 278 or curBeat == 280 or curBeat == 282 or curBeat == 284 or curBeat == 286 then
        fuckYou()
    elseif curBeat == 257 or curBeat == 259 or curBeat == 261 or curBeat == 263 or curBeat == 265 or curBeat == 267 or curBeat == 269 or curBeat == 271 or curBeat == 273 or curBeat == 275 or curBeat == 277 or curBeat == 279 or curBeat == 281 or curBeat == 283 or curBeat == 285 or curBeat == 287 then
        nevermind()
    end
end

function onUpdate(elapsed)
    if funnySpinActive then
        funnySpin(elapsed)
    end
end