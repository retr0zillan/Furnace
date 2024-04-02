import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxColor;
import haxe.io.Path;
import lime.ui.FileDialog;
import lime.ui.FileDialogType;
import openfl.net.FileReference;
import funkin.menus.MainMenuState;
import sys.io.File;
import sys.FileSystem;

var text:FlxText;
var button:FlxButton;

function create()
{
    text=new FlxText(0,0,FlxG.width,"Convert",17);
    text.x=10;
    text.y=10;
    add(text);

    button=new FlxButton(0,0,"Click to convert",onClick);
    button.screenCenter();
    add(button);

    FlxG.mouse.visible=true;
}

function onClick()
{
    var fDial = new FileDialog();
    fDial.onSelect.add(function(file)
    {
        var fileName = Path.withoutExtension(Path.withoutDirectory(file));
        var json = CoolUtil.parseJsonString(File.getContent(file));
        var xmlNew = '<!DOCTYPE codename-engine-character> <!--Character Converter -->\n<character isPlayer="'
            + charPlayerCheck.checked
            + '" x="'
            + json.position[0]
            + '" y="'
            + json.position[1]
            + '" icon="'
            + json.healthicon
            + '" flipX="'
            + json.flip_x
            + '" camx="'
            + json.camera_position[0]
            + '" camy="'
            + json.camera_position[1]
            + '" holdTime="'
            + json.sing_duration
            + '" scale="'
            + json.scale
            + '">\n';
        for (i in 0...json.animations.length)
        {
            xmlNew += '\t<anim name="'
                + json.animations[i].anim + '" anim="' + json.animations[i].name + '" fps="' + json.animations[i].fps + '" loop="' + json.animations[i].loop
                    + '" x="'
                    + (json.animations[i].offsets[0] / json.scale)
                    + '" y="'
                    + (json.animations[i].offsets[1] / json.scale)
                    + '"';
            if (json.animations[i].indices.length > 0)
                xmlNew += ' indices="' + json.animations[i].indices + '"/>\n';
            else
                xmlNew += '/>\n';
        }
        xmlNew += '</character>';
        var savePath = Path.join([FlxG.savePath, "data", "characters", fileName + ".xml"]);
        new FileReference().save(xmlNew, savePath);
    });
    fDial.browse(FileDialogType.OPEN, 'json', null, 'Open A Psych Engine Character JSON.');
}

function update(elapsed){
    if(controls.BACK){
        FlxG.switchState(new MainMenuState());
    }
}