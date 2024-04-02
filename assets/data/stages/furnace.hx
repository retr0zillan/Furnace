import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.options.OptionsScreen;


var coolShader:CustomShader;
var glitch:CustomShader;

var heat:WiggleEffect;
function preload(imagePath:String) {
    var graphic = FlxG.bitmap.add(Paths.image(imagePath));
    graphic.useCount++;
    graphic.destroyOnNoUse = false;
    graphicCache.cachedGraphics.push(graphic);
    graphicCache.nonRenderedCachedGraphics.push(graphic);
}
function create(){

	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');

	importScript("data/scripts/camera");

	importScript("data/scripts/loadfurnotes");

	shade.cameras = [camHUD];
	shade.screenCenter();
	shade.scrollFactor.set();

	preload('stages/wireframe/Bars');
	preload('stages/wireframe/Furnace Center');
	preload('stages/wireframe/Furnace Left');
	preload('stages/wireframe/Furnace Right');
	preload('stages/wireframe/Plataform');
	preload('stages/wireframe/Red Background');


}


public var heatShader:CustomShader;

public var chroma:CustomShader;
public var vhs:CustomShader;

var wiggleEffect:WiggleEffect;
function postCreate(){



	if(Options.gameplayShaders) {
		var shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
		shit.scale.set(5,5);
		shit.shader = coolShader;
		coolShader.inten = 1.5;

		insert(members.indexOf(platform), shit);
		left.shader = heatShader;
		center.shader = heatShader;
		right.shader = heatShader;
		coolShader.doDiv = false;
	
	
		
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