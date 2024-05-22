import flixel.addons.effects.FlxTrail;
import funkin.game.PlayState;
var self = this;
var trail:FlxTrail;
var toAdd:Bool = true;  // Using this just to make sure

function postCreate(){
	if(PlayState.SONG.meta.name.toLowerCase() == 'combustion'){
		trail = new FlxTrail(self, null, 3, 15, 0.4, 0.05);
		trail.color = 0xFFf44336;
	}
}
function update(elpased) {
	if(toAdd && PlayState.SONG.meta.name.toLowerCase() == 'combustion') {
		toAdd = false;
		//PlayState.instance.insert(PlayState.instance.members.indexOf(self), trail);
		disableScript();
	}
}