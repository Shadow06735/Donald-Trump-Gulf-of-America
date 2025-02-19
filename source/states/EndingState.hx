package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;

class EndingState extends MusicBeatState
{
    var goodEnd:FlxSprite;
    var badEnd:FlxSprite;
    var secretEnd:FlxSprite;

    override function create()
    {
        goodEnd = new FlxSprite().loadGraphic(Paths.image('goodEnd'));
        goodEnd.screenCenter();
        goodEnd.antialiasing = ClientPrefs.data.antialiasing;

        badEnd = new FlxSprite().loadGraphic(Paths.image('badEnd'));
        badEnd.screenCenter();
        badEnd.antialiasing = ClientPrefs.data.antialiasing;

        secretEnd = new FlxSprite().loadGraphic(Paths.image('nocheating'));
        secretEnd.screenCenter();
        secretEnd.antialiasing = ClientPrefs.data.antialiasing;

        if (PlayState.achievedGoodEnd)
        {
            add(goodEnd);
            new FlxTimer().start(15, function(timer:FlxTimer) {
                MusicBeatState.switchState(new StoryMenuState());
                FlxG.sound.playMusic(Paths.music('freakyMenu'));
            });
        }
        else if (PlayState.cheatingDetected)
        {
            add(secretEnd);
            FlxG.sound.playMusic(Paths.music('peanut'));
            new FlxTimer().start(8, function(timer:FlxTimer) {
                MusicBeatState.switchState(new StoryMenuState());
                FlxG.sound.playMusic(Paths.music('freakyMenu'));
            });
        }
        else
        {
            add(badEnd);
            new FlxTimer().start(10, function(timer:FlxTimer) {
                MusicBeatState.switchState(new StoryMenuState());
                FlxG.sound.playMusic(Paths.music('freakyMenu'));
            });
            new FlxTimer().start(9.5, function(timer:FlxTimer) {
                FlxG.sound.play(Paths.sound('augh'), 0.7);
            });
        }

        super.create();
    }
}