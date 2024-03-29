public var strength=10;
public var enabled=false;

function postCreate()trace(enabled);

function postUpdate(elapsed:Float){
    if (!enabled)return;
    var anim=strumLines.members[curCameraTarget].characters[0].getAnimName();
    switch(anim){
        case "singLEFT"|"singLEFT-alt":camFollow.x-=strength;
        case "singDOWN"|"singDOWN-alt":camFollow.y+=strength;
        case "singUP"|"singUP-alt":camFollow.y-=strength;
        case "singRIGHT"|"singRIGHT-alt":camFollow.x+=strength;
    }
}
