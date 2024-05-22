import funkin.backend.shaders.CustomShader;
import funkin.game.Character;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.game.PlayState;
var outlineShader = null;
function create(){


	for(i in 0...preloadStuff.length){
		graphicCache.cache(Paths.image(preloadStuff[i]));
	}
	trace('created shit');
	
	} 


	var preloadStuff = [
		'stages/combustion/bars',
		'stages/combustion/center',
		'stages/combustion/left',
		'stages/combustion/right',
		'stages/combustion/platform',
		'stages/combustion/redbg',
		'game/transition'
		];


var updater:Float = 0;
var ignoreBfNotes:Bool =false;
function onNoteHit(event){
	if(event.character != dad &&ignoreBfNotes){
		event.preventAnim();
		if(event.character.animation.curAnim.name!='idle')
		event.character.playAnim('idle', true, "DANCE");
	}
}

function update(elpased:Float){
	updater += elpased;
	//outlineShader.iTime = updater;
}
function centerStrums(event){
	ignoreBfNotes = event == "in" ? true : false;
	trace(event);
for(strum in playerStrums){
	FlxTween.tween(strum, {x: event == "in"? strum.x - 300: strum.x + 300}, 0.7, {ease:FlxEase.quadOut});
}
for(strum in cpuStrums){

	FlxTween.tween(strum, {alpha: event == "in" ? 0: 1}, 0.7, {ease:FlxEase.quadOut});

	FlxTween.tween(strum, {x: event == "in"? strum.x + 340 : strum.x - 340}, 0.7, {ease:FlxEase.quadOut, onComplete: function(_){
		
		for(note in cpuStrums.notes){
			note.visible = event == "in" ? false : true;
		}

	}});
}

}

function transition(event) {
	var trans = new FlxSprite(-400,-500);
	
	trans.frames = Paths.getFrames('game/transition');
	trans.antialiasing=true;
	trans.animation.addByPrefix('trans', 'transition', 24, false);
	trans.cameras = [camHealth];
	trans.scrollFactor.set();
	trans.animation.play('trans');
	add(trans);

	trans.animation.finishCallback = function(_){
		remove(trans);
		



	}
}