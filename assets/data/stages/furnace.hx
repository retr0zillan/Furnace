import flixel.math.FlxRandom;
import funkin.backend.shaders.WiggleEffect;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;

var generator:FlxRandom = new FlxRandom();
var particles:FlxTypedGroup<FlxSprite> =  new FlxTypedGroup();
var coolShader:CustomShader;
var heat:WiggleEffect;
function create(){
	shade.cameras = [camHUD];
	shade.screenCenter();
	shade.scrollFactor.set();
	enabled=true;
}
function moveObject(obj:FlxObject){
    FlxG.watch.addQuick('obj', 'X:'+obj.x+' Y:'+obj.y);
    if(FlxG.keys.pressed.I){
        obj.y -= 1;
    }
    if(FlxG.keys.pressed.K){
        obj.y += 1;

    }
    if(FlxG.keys.pressed.L){
        obj.x += 1;

    }
    if(FlxG.keys.pressed.J){
        obj.x -= 1;

    }
}	
var heatShader:CustomShader;

function postCreate(){
	coolShader = new CustomShader('fuegoentucorazon');
	heatShader = new CustomShader('furnaceHeatGaySex2024');


	var shit = new FunkinSprite(0,-700).makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
	shit.scale.set(5,5);
	shit.shader = coolShader;
	insert(members.indexOf(platform), shit);
	if(Options.gameplayShaders) {
	left.shader = heatShader;
	center.shader = heatShader;
	right.shader = heatShader;

	}
	


}
var updater:Float=0;
function postUpdate(elapsed) {

	
if(FlxG.keys.justPressed.F6){
            player.cpu = !player.cpu;
        }
		if(Options.gameplayShaders){
			updater+=elapsed;
			heatShader.iTime = updater;
			coolShader.iTime = updater;
		}



}