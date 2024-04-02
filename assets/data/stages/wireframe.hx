import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

var coolShader:CustomShader;
var glitch:CustomShader;
var heat:WiggleEffect;

function create(){

	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");

	
	shade.cameras = [camHUD];
	shade.screenCenter();
	shade.scrollFactor.set();




}


public var heatShader:CustomShader;

public var pixel:CustomShader;
var wiggleEffect:WiggleEffect;

function postCreate(){



	if(Options.gameplayShaders) {
		var shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;
		
		insert(members.indexOf(platform), shit);
		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
		bars.shader = heatShader;
		platform.shader = heatShader;
		
		coolShader.inten = 20;
		coolShader.doDiv = true;
	
	
		
	}
	


}
var updater:Float=0;
var beater:Float = 0;

function beatHit(curBeat:Int){
	
	

}

function postUpdate(elapsed) {
	
			
		if(Options.gameplayShaders){
		

			updater+=elapsed;
		
			heatShader.iTime = updater;
			coolShader.iTime = updater;
		}



}
