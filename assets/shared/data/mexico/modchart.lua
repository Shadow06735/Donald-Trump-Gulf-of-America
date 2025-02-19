local originalXPositions = {}
local originalYPositions = {}

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

--the actual modchart
function onSongStart()
    for i = 0, 7 do
        table.insert(originalXPositions, getPropertyFromGroup('strumLineNotes', i, 'x'))
        table.insert(originalYPositions, getPropertyFromGroup('strumLineNotes', i, 'y'))
    end
end

function onBeatHit()
    if curBeat == 224 or curBeat == 228 or curBeat == 232 or curBeat == 236 or curBeat == 240 or curBeat == 244 or curBeat == 248 or curBeat == 252 then
        funnyMove1()
    elseif curBeat == 226 or curBeat == 230 or curBeat == 234 or curBeat == 238 or curBeat == 242 or curBeat == 246 or curBeat == 250 or curBeat == 254 then
        funnyMove2()
    elseif curBeat == 225 or curBeat == 229 or curBeat == 233 or curBeat == 237 or curBeat == 241 or curBeat == 245 or curBeat == 249 or curBeat == 253 then
        goBackY()
    elseif curBeat == 227 or curBeat == 231 or curBeat == 235 or curBeat == 239 or curBeat == 243 or curBeat == 247 or curBeat == 251 or curBeat == 255 then
        goBackX()
    end
    if curBeat == 256 or curBeat == 258 or curBeat == 260 or curBeat == 262 or curBeat == 264 or curBeat == 266 or curBeat == 268 or curBeat == 270 or curBeat == 272 or curBeat == 274 or curBeat == 276 or curBeat == 278 or curBeat == 280 or curBeat == 282 or curBeat == 284 or curBeat == 286 then
        fuckYou()
        showOnlyStrums()
    elseif curBeat == 257 or curBeat == 259 or curBeat == 261 or curBeat == 263 or curBeat == 265 or curBeat == 267 or curBeat == 269 or curBeat == 271 or curBeat == 273 or curBeat == 275 or curBeat == 277 or curBeat == 279 or curBeat == 281 or curBeat == 283 or curBeat == 285 or curBeat == 287 then
        nevermind()
    end
    if curBeat == 288 then
        showOnlyStrums(false)
    end
end