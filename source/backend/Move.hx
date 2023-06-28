package backend;

enum Move {
    Noncapture(from:Int, to:Int);
    Capture(from:Int, to:Int, capture:Int);
    Castle(direction:CastleDirection);
}

enum CastleDirection {
    Queenside;
    Kingside;
}
