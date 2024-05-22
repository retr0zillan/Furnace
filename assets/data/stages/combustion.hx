import funkin.game.Character;
import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.options.OptionsScreen;
import openfl.display.BlendMode;
import flixel.group.FlxGroup.FlxTypedGroup;

var heatShader= null;
var coolShader = null;
var shit:FunkinSprite;

function create(){

	heatShader = new CustomShader('furnaceHeatGaySex2024');
	coolShader = new CustomShader('fuegoentucorazon');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");





}
function beatHit(curBeat:Int) {
	if(curBeat%4 == 0 && curBeat < 718){
		trace("beat!!!1");
		daVal += 200;
	}
}
var daVal:Float = 5;

function destroy() {
	trace(':c');
	if(Options.gameplayShaders) {
		
		heatShader = null;
		coolShader = null;
		shit.destroy();
	}

}
function postCreate(){
	if(Options.gameplayShaders) {	
		shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;
		insert(members.indexOf(platform), shit);

		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
		coolShader.inten = 20;
		coolShader.doDiv = false;
	}
}
var updater:Float=0;
function postUpdate(elapsed) {
	FlxG.watch.addQuick("intensity", daVal);
	FlxG.watch.addQuick("beat", curBeat);

	if(Options.gameplayShaders){
		daVal = lerp(daVal, 20, 0.05);

		coolShader.inten = daVal;
		updater+=elapsed;
		heatShader.iTime = updater;
		coolShader.iTime = updater;

	}

}