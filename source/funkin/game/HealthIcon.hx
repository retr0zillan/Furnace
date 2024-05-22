package funkin.game;
import haxe.xml.Access;
import sys.FileSystem;
import funkin.backend.utils.XMLUtil;

class HealthIcon extends FunkinSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	/**
	 * Health steps in this format:
	 * Min Percentage => Frame Index
	 */
	 public var healthSteps:Map<Int, Int> = null;

	 public var isPlayer:Bool;
	 public var curCharacter:String = null;

	/**
	 * Helper for HScript who can't make maps
	 * @param steps Something like this: `[[0, 1], [20, 0]]`
	 */
	public function setHealthSteps(steps:Array<Array<Int>>) { // helper for hscript that can't do maps
		if (steps == null) return;
		healthSteps = [];
		for(s in steps)
			if (s.length > 1)
				healthSteps[s[0]] = s[1]; 
		var am = 0;
		for(k=>e in healthSteps) am++;

		if (am <= 0) healthSteps = [
			0  => 1, // losing icon
			20 => 0, // normal icon
		];
	}

	public function setIcon(char:String, width:Int = 150, height:Int = 150) {
		if(curCharacter != char || this.width != width || this.height != height) {
			curCharacter = char;
			var path = Paths.image('icons/$char');
			hasAnimIcon = Character.getHasAnimIcon(char);
			
			if (!Assets.exists(path)) path = Paths.image('icons/face');

			healthSteps = [
				0  => 1, // losing icon
				20 => 0, // normal icon
			];

			if(!hasAnimIcon){
				loadGraphic(path, true, 150, 150);

				animation.add(char, [for(i in 0...frames.frames.length) i], 0, false, isPlayer);
				antialiasing = true;
				animation.play(char);
		
				if (frames.frames.length >= 3)
					healthSteps[80] = 2; // winning icon
			}
			else{
				if(Assets.exists(Paths.xml('icons/$char'))){
					trace('we got icon shit');
					var xmlPath = Paths.xml('icons/$char');
					var plainXML = Assets.getText(xmlPath);
					var shit = Xml.parse(plainXML).firstElement();
	
					//pain in the ass
					var meta = new Access(shit);
	
					if(meta.x.exists("sprite")) frames = Paths.getFrames('icons/animated/${meta.x.get("sprite")}');
					if(meta.x.exists("flipX")) flipX = (meta.x.get("flipX") == "true");
	
					for(anim in meta.nodes.anim){
	
						XMLUtil.addXMLAnimation(this, anim);
						
					}
					antialiasing = true;
	
					playAnim('normal');
				}
			}

		
		}
	}

	public var hasAnimIcon:Bool = false;
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		health = 0.5;
		this.isPlayer = isPlayer;
		setIcon(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);

		if (animation.curAnim != null) {
			
			var i:Int = -1;
			var oldKey:Int = -1;
			for(k=>icon in healthSteps) {
				if (k > oldKey && k < health * 100) {
					oldKey = k;
					i = icon;
				}
			}
	
				if (i >= 0){
					
					if(!hasAnimIcon)
					animation.curAnim.curFrame = i;
					else
						switch(i){
							case 0:
								if(animation.curAnim.name!='normal')this.playAnim('normal'); 
		
							case 1:
		
								if(animation.getByName('transition')!=null){
									if(animation.curAnim.name!='transition' && animation.curAnim.name != 'losing'){
										this.playAnim('transition');
										animation.finishCallback=function(_){
											this.playAnim('losing');
	
										}
									}
									
								}
								else{
									if(animation.curAnim.name!='losing')this.playAnim('losing'); 

								}

		
						}
				} 

			
			
			
			
		}
	}
}
