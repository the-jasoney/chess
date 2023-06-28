package backend;

import haxe.Int64;
import StringTools.hex;

abstract Mask(Int64) {
    inline function new(i:Int64) {
        this = i;
    }

    inline public function setBit(bit:Int) {
        this |= (1 << bit);
    }

    inline public function clearBit(bit:Int) {
        this &= (~(1 << bit));
    }

    public function getBit(bit:Int): Bool {
        return ((1 << bit) & this) != 0;
    }

    @:to
    public function toString() {
        return hex(this.high, 8) + hex(this.low, 8);
    }

    @:from
    static public function fromInt64(i:Int64):Mask {
        return new Mask(i);
    }

    @:from
    static public function fromInt(i:Int):Mask {
        return new Mask(Int64.make(0, i));
    }
}
