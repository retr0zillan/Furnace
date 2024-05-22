import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.options.OptionsScreen;


var coolShader=null;
var glitch:CustomShader;


function create(){

	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");

	shade.cameras = [camHUD];
	shade.screenCenter();
	shade.scrollFactor.set();


}


var heatShader=null;

public var chroma:CustomShader;
public var vhs:CustomShader;

var wiggleEffect:WiggleEffect;
function postCreate(){

	


	trace(dad.x);
	trace(dad.y);

	if(Options.gameplayShaders) {
		var shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;

	
		insert(members.indexOf(platform), shit);
		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
	
		coolShader.inten = 5.0;
		coolShader.doDiv = false;
		
	}
	


}
function destroy() {
	trace(':c');
	if(Options.gameplayShaders) {
		heatShader = null;
		coolShader = null;
		shit.destroy();
	}

}
var updater:Float=0;

function postUpdate(elapsed) {
	
			
		if(Options.gameplayShaders){
		

			updater+=elapsed;
			heatShader.iTime = updater;
			coolShader.iTime = updater;
		}



}