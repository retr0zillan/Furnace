function postUpdate(elapsed:Float){
    if (FlxG.keys.justPressed.FOUR){
        FlxG.switchState(new ModState("Psychtocne"));
    }
}