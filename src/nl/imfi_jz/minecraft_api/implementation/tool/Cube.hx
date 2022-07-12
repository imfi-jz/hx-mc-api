package nl.imfi_jz.minecraft_api.implementation.tool;

import nl.imfi_jz.minecraft_api.implementation.unchanging.ThreeDimensional;

/** Helper class for planes with equal sized width, height and depth **/
class Cube extends Square {
    public inline function new(length:Float) {
        super(new UnchangingThreeDimensional(length, length, length));
    }
}