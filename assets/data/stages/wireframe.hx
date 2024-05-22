import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

var coolShader=null;

function create(){

	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");



}


var heatShader=null;

var shit:FunkinSprite;
function postCreate(){



	if(Options.gameplayShaders) {
		shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;

		insert(members.indexOf(platform), shit);
		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
		bars.shader = heatShader;
		platform.shader = heatShader;
		
		coolShader.inten = 25;
		coolShader.doDiv = true;
	
	
		
	}
	


}
function beatHit(curBeat:Int) {
	if(curBeat%4 == 0 && PlayState.SONG.meta.name.toLowerCase() == "combustion" && curBeat > 583 && curBeat < 647){
		trace("beat!!!1");
		daVal += 20;
	}
}
var updater:Float=0;
var beater:Float = 0;
var daVal:Float = 25;

function destroy() {
	if(Options.gameplayShaders)
	{

		trace(':c');
		heatShader = null;
		coolShader = null;
		shit.destroy();
	}
}

function postUpdate(elapsed) {
	
			
		if(Options.gameplayShaders){
		
			daVal = lerp(daVal, 25, 0.06);
			coolShader.inten = daVal;
			updater+=elapsed;
		
			heatShader.iTime = updater;
			coolShader.iTime = updater;
		}



}
