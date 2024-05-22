import funkin.game.PlayState;
import flixel.math.FlxMath;
import funkin.game.Character;
import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.options.OptionsScreen;
import openfl.display.BlendMode;
import openfl.filters.GlowFilter;
import openfl.geom.Rectangle;
import openfl.geom.Point;
var coolShader = null;
var heat:WiggleEffect;
var glow:GlowFilter;
function create(){


	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");

	shade.cameras = [camHUD];
	shade.screenCenter();
	shade.scrollFactor.set();

	

}


var heatShader= null;
var daVal:Float = 1.5;


var shit:FunkinSprite;
function postCreate(){
	trace(gf.curCharacter);
	


	if(Options.gameplayShaders) {
		shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;
	
	
		insert(members.indexOf(platform), shit);
		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
	
	
		coolShader.inten = 1.5;
		coolShader.doDiv = false;


	}



}

var updater:Float=0;
function destroy() {
	trace(':c');
	if(Options.gameplayShaders) {
		heatShader = null;
		coolShader = null;
		shit.destroy();
	}

}
function beatHit(curBeat:Int) {
	if(curBeat%4 == 0 && PlayState.SONG.meta.name.toLowerCase() == "combustion" && curBeat > 583 && curBeat < 647){
		trace("beat!!!1");
		daVal += 20;
	}
}
function postUpdate(elapsed:Float) {
	
		if(Options.gameplayShaders){
		
			daVal = lerp(daVal, 1.5, 0.06);
			coolShader.inten = daVal;

			updater+=elapsed;
	
		
		

			heatShader.iTime = updater;
			coolShader.iTime = updater;
		}



}