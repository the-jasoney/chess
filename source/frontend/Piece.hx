package frontend;

import openfl.utils.Dictionary;
import flixel.FlxSprite;

class Piece extends FlxSprite
{
    public var isOwnedByHuman:Bool;
    public var rank:Int;
    public var file:Int;
    public var piece:Int;
    // piece is equal to piece type (ex pawn) | piece color

    public function new(x:Float, y:Float)
    {
        super(x,y);
    }
    public function setType(pieceType:Int)
    {
        loadGraphic(this.pieceDict[pieceType]);
    }
    private var pieceDict:Map<Int, String> = [
/* white pieces */
        9 => AssetPaths.white_pawn__png,
        10 => AssetPaths.white_bishop__png,
        11 => AssetPaths.white_knight__png,
        12 => AssetPaths.white_rook__png,
        13 => AssetPaths.white_queen__png,
        14 => AssetPaths.white_king__png,
/* black pieces */
        17 => AssetPaths.black_pawn__png,
        18 => AssetPaths.black_bishop__png,
        19 => AssetPaths.black_knight__png,
        20 => AssetPaths.black_rook__png,
        21 => AssetPaths.black_queen__png,
        22 => AssetPaths.black_king__png
    ];
}
