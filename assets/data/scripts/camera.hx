public var strength=10;

function postUpdate(elapsed:Float){
 
    var anim=strumLines.members[curCameraTarget].characters[0].getAnimName();
    switch(anim){
        case "singLEFT"|"singLEFT-alt":camFollow.x-=strength;
        case "singDOWN"|"singDOWN-alt":camFollow.y+=strength;
        case "singUP"|"singUP-alt":camFollow.y-=strength;
        case "singRIGHT"|"singRIGHT-alt":camFollow.x+=strength;
    }
}