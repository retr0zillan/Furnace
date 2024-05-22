import funkin.game.Character;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.animation.FlxAnimation;
import flixel.util.FlxColor;

class FurnaceTrail extends flixel.FlxSprite
{
    public function new(character:funkin.game.Character,daColor:FlxColor, group:FlxTypedGroup<FurnaceTrail>, ?isDad:Bool = false)
    {
        super();
        frames = character.frames;
		//alpha = 0.3;
        alpha = 0.6;
		setGraphicSize(Std.int(character.width), Std.int(character.height));
		scrollFactor.set(character.scrollFactor.x,character.scrollFactor.y);
		updateHitbox();
		flipX = character.flipX;
		flipY = character.flipY;
		x = character.x + FlxG.random.float(0,60);
		y = character.y + FlxG.random.float(-50, 50);
		offset.x = character.offset.x;
		offset.y = character.offset.y; 
		animation.add('cur', character.animation.curAnim.frames, 24, false);
		animation.play('cur', true);
        animation.curAnim.curFrame = character.animation.curAnim.curFrame;
		color = daColor;
		var fuck = FlxG.random.bool(70);
		
		var velo = 12 * 5;
		if (isDad) {
			if (fuck) velocity.x = -velo;
			else velocity.x = velo;
		}
		else {
			if (fuck) velocity.x = velo;
			else velocity.x = -velo;
		}			
	
		FlxTween.tween(this, {alpha: 0}, 0.35, {
			onComplete: function(twn:FlxTween)
			{
		
				destroy();
			}
		});

		group.add(this);
    }
}