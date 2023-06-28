package frontend;

import backend.Game;
import flixel.FlxState;
import frontend.Cell;

class ChessBoard extends FlxState
{
	public var game:Game;
	public var cells:Array<Cell> = [];
	public var isWhite:Bool = true;

	public function new(){
		super();
		game = new Game("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR");
		createBoard();
	}

	override public function create()
	{
		super.create();
		createBoard();
	}

	private function createBoard() {
		for (file in 0...8) {
			for (rank in 0...8) {
				var cell = new Cell(rank, file);
				this.cells.push(cell);
				add(cell);
			}
		}
	}
}
