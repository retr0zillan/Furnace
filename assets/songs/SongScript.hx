
import flixel.FlxCamera;
import flixel.FlxG;
import funkin.game.PlayState;
public var camHealth:FlxCamera;
function postCreate(){
    FlxG.cameras.add(camHealth = new FlxCamera(), false);
    camHealth.bgColor = '#00000000';

	if(downscroll)
		healthBarBG.y = FlxG.height*.1;

	
	healthBar.setPosition(healthBarBG.x + 4, healthBarBG.y + 4);
	scoreTxt.setPosition(healthBarBG.x + 50, healthBarBG.y + 30);
	missesTxt.setPosition(healthBarBG.x + 50, healthBarBG.y + 30);
	accuracyTxt.setPosition(healthBarBG.x + 50, healthBarBG.y + 30);
	for(icon in [iconP1, iconP2]) {
		icon.y = healthBar.y - (icon.height / 2);

	}
	for(e in [healthBar, healthBarBG, iconP1, iconP2, scoreTxt, missesTxt, accuracyTxt])
		e.cameras = [camHealth];

	
}