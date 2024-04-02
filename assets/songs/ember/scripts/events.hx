import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
function create(){
	camNotes.alpha=0;
}


function postCreate(){
	FlxG.camera.followLerp=100000;
	camHUD.alpha=0;
} 
function stepHit(){
	switch(curStep){
		case 8:
			FlxG.camera.zoom=0.6;
		case 10:
			FlxG.camera.zoom=0.7;
		case 12:
			FlxG.camera.zoom=0.8;
		case 14:
			FlxG.camera.zoom=0.9;
		case 17:
			FlxG.camera.followLerp=0.04;
			FlxTween.tween(camNotes,{alpha:1},1);
			FlxTween.tween(camHUD,{alpha:1},1);
	}
}
function beatHit(){
	switch(curBeat){
		case 67:
			FlxTween.tween(FlxG.camera,{zoom:1},2.8,{
				ease:FlxEase.quadInOut,
				onComplete:function(tdfhnterhnrhtn:FlxTween)
				{
					defaultCamZoom=0.5;
				}
			});
	}
}
