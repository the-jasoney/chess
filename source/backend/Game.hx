package backend;

class Game {
    public var board:Bitboard;
    public var moves:Array<{move:Move, board:Bitboard}>;

    public function new(fen:String) {
        board = new Bitboard(fen);
        moves = [];
    }

    public function getBoard():Array<Int> {
        return board.as_piece_array();
    }
}
