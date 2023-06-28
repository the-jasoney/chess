package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		FlxG.mouse.useSystemCursor = true;

		add(new FlxText(10, 10, 0, "chess.exe ", 16));
		add(new ChessBoard());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
