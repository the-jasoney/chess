package frontend;

import flixel.util.FlxSpriteUtil.LineStyle;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeBox;
import flixel.addons.display.shapes.FlxShape;
import flixel.FlxSprite;

class Cell extends FlxSprite
{
    // -(file - 7) * cellwidth = x
	// -(rank - 7) * cellheight = y
    public var rank:Int;
    public var file:Int;

	public static final cellSize:Int = 64;
	public static final _offset:{x:Int, y:Int} = {x: 128, y: 128};

	// if square is white: rank % 2 != file % 2
	public function new(rank:Int, file:Int)
	{
		super((-(file - 7) * cellSize), (-(rank - 7) * cellSize));
		x += _offset.x;
		y += _offset.y;
		this.rank = rank;
		this.file = file;
        localize();

	}

    private function localize()
	{
		var color:FlxColor = this.rank % 2 == this.file % 2
			? FlxColor.GREEN
			: FlxColor.WHITE;

        makeGraphic(64, 64, color);
    }
}
