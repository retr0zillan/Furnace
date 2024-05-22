import funkin.game.Stage;

function unprepareCharacter(char:Character, charInfo, id:Float = 0) {
    char.setPosition(charInfo.x - (id * charInfo.charSpacingX), charInfo.y - (id * charInfo.charSpacingY));
    char.scrollFactor.set(1, 1);

    char.scale.x /= charInfo.scale.x; char.scale.y /= charInfo.scale.y;
	char.cameraOffset.x = char.xml.exists("camx") ? Std.parseFloat(char.xml.get("camx")) : 0;
    char.cameraOffset.y = char.xml.exists("camy") ? Std.parseFloat(char.xml.get("camy")) : 0;
    char.skew.x -= charInfo.skewX; char.skew.y -= charInfo.skewY;
    char.alpha /= charInfo.alpha;
}

function onEvent(e) {
    var event = e.event;
    switch (event.name) {
        case "Switch Stage", "Switch_Stage":
            if (event.params[0] == curStage) return;

            stage.stageScript?.call("stageSwitch");
            stage.stageScript?.call("destroy");
            stage.stageScript?.active = false;

            for (sprites in stage.stageSprites) {
                remove(sprites, true);
            }
            var chars = [];
            var sti = 0;
            for(strumLine in strumLines.members) {
                var defaultPosition = switch(strumLine.data.type) {
                    case 0: "dad";
                    case 1: "boyfriend";
                    case 2: "girlfriend";
                };
                var charPosName:String = strumLine.data.position == null ? defaultPosition : strumLine.data.position;
                var k = 0;
                for(char in strumLine.characters) {
                    if(stage.characterPoses.exists(charPosName)) {
                        unprepareCharacter(char, stage.characterPoses[charPosName], k);
                    }
                    remove(char, true);
                    
                    chars.push({
                        char: char,
                        charPosName: charPosName,
                        k: k
                    });

                    k++;
                }

                sti++;
            }
            remove(stage, true);
            stage.destroy();

            add(stage = new Stage(event.params[0]));

            stage.stageScript?.call("create");
            stage.stageScript?.call("postCreate");
	

            for(ch in chars) {
                var char = ch.char;
                var charPosName = ch.charPosName;
                var k = ch.k;
                stage.applyCharStuff(char, charPosName, k);
            }

    }
}