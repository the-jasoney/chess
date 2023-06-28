package backend;

import backend.Mask.getBit;
import backend.Mask.setBit;
import haxe.iterators.StringIterator;

final piecemap = [
	[false, false, false, false, false, false, false, false] => NONE,

	[true, false, false, false, false, false, true, false] => PAWN | WHITE,
	[false, true, false, false, false, false, true, false] => BISHOP | WHITE,
	[false, false, true, false, false, false, true, false] => KNIGHT | WHITE,
	[false, false, false, true, false, false, true, false] => ROOK | WHITE,
	[false, false, false, false, true, false, true, false] => QUEEN | WHITE,
	[false, false, false, false, false, true, true, false] => KING | WHITE,

	[true, false, false, false, false, false, false, true] => PAWN | BLACK,
	[false, true, false, false, false, false, false, true] => BISHOP | BLACK,
	[false, false, true, false, false, false, false, true] => KNIGHT | BLACK,
	[false, false, false, true, false, false, false, true] => ROOK | BLACK,
	[false, false, false, false, true, false, false, true] => QUEEN | BLACK,
	[false, false, false, false, false, true, false, true] => KING | BLACK,
];

class Bitboard
{
	// -- piece masks
	public var nPawn:Mask;
	public var nBishop:Mask;
	public var nKnight:Mask;
	public var nRook:Mask;
	public var nQueen:Mask;
	public var nKing:Mask;

	// -- color masks
	public var nWhite:Mask;
	public var nBlack:Mask;

	// -- special masks
	public var nMoved:Mask;

	// en passant target square
	public var nEPTarget:Mask;

	public function new(fen: String) {
		// instantiate all masks
		nPawn = nBishop = nKnight = nRook = nQueen = nKing = nWhite = nBlack = nMoved = nEPTarget = 0;

		var fenIter = new StringIterator(fen);

		var rank = 7;
		var file = 0;

		for (i in fenIter) {
			switch (i) {
				// TODO unspaghetti-fy this
				case 114: // 'r'

					nBlack.setBit(rank * 8 + file);
					nRook.setBit(rank * 8 + file);
					file ++;

				case 110: // 'n'
					nBlack.setBit(rank * 8 + file);
					nKnight.setBit(rank * 8 + file);
					file ++;

				case 98: // 'b'
					nBlack.setBit(rank * 8 + file);
					nBishop.setBit(rank * 8 + file);
					file ++;

				case 112: // 'p'
					nBlack.setBit(rank * 8 + file);
					nPawn.setBit(rank * 8 + file);
					file ++;

				case 113: // 'q'
					nBlack.setBit(rank * 8 + file);
					nQueen.setBit(rank * 8 + file);
					file ++;

				case 107: // 'k'
					nBlack.setBit(rank * 8 + file);
					nKing.setBit(rank * 8 + file);
					file ++;

				case 82: // 'R'
					nWhite.setBit(rank * 8 + file);
					nRook.setBit(rank * 8 + file);
					file ++;

				case 78: // 'N'
					nWhite.setBit(rank * 8 + file);
					nKnight.setBit(rank * 8 + file);
					file ++;

				case 66: // 'B'
					nWhite.setBit(rank * 8 + file);
					nBishop.setBit(rank * 8 + file);
					file ++;

				case 80: // 'P'
					nWhite.setBit(rank * 8 + file);
					nPawn.setBit(rank * 8 + file);
					file ++;

				case 81: // 'Q'
					nWhite.setBit(rank * 8 + file);
					nQueen.setBit(rank * 8 + file);
					file ++;

				case 75: // 'K'
					nWhite.setBit(rank * 8 + file);
					nKing.setBit(rank * 8 + file);
					file ++;

				case 49: // '1'
					file ++;

				case 50: // '2'
					file += 2;

				case 51: // '3'
					file += 3;

				case 52: // '4'
					file += 4;

				case 53: // '5'
					file += 5;

				case 54: // '6'
					file += 6;

				case 55: // '7'
					file += 7;

				case 56: // '8'
					file += 8;

				case 47: // '/'
					rank --;
					file = 0;
			}
		}
		nQueen.setBit(35);
		nQueen.setBit(56);
		trace(this);
	}

	public function as_piece_array() {
		var result: Array<Int> = [];
		for (i in 0...64) {
			var pieceArray = [
				nPawn.getBit(i),
				nBishop.getBit(i),
				nKnight.getBit(i),
				nRook.getBit(i),
				nQueen.getBit(i),
				nKing.getBit(i),
				nWhite.getBit(i),
				nBlack.getBit(i)
			];

			result.push(piecemap[pieceArray]);
		}

		return result;
	}
}
