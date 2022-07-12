package nl.imfi_jz.minecraft_api.implementation.tool;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.ThreeDimensional;
import nl.imfi_jz.minecraft_api.GameObject.Block;
import haxe.ds.Vector;
import nl.imfi_jz.minecraft_api.implementation.unchanging.ThreeDimensional.UnchangingThreeDimensional;

/** Helper class for square areas. **/
class Square extends UnchangingThreeDimensional {
    public inline function new(dimensions:ThreeDimensional) {
        super(dimensions.getX(), dimensions.getY(), dimensions.getZ());
    }

    /** Gets all coordinates within this area, at `coordinates`, with the amount of `interval` in between each coordinate. **/
    public function getContainingCoordinatesFrom(coordinates:ThreeDimensional, interval:Float = 1):StandardCollection<ThreeDimensional> {
        final allCoordinates = new StandardCollection<ThreeDimensional>();

        var x = coordinates.getX();
        var y = coordinates.getY();
        var z = coordinates.getZ();
        final endX = x + getX();
        final endY = y + getY();
        final endZ = z + getZ();
        while(x < endX){
            x += interval;
            while(y < endY){
                y += interval;
                while(z < endZ){
                    z += interval;
                    allCoordinates.push(new UnchangingThreeDimensional(x, y, z));
                }
            }
        }
        return allCoordinates;
    }

    /** Gets all blocks within this area at `coordinates` in `world`. **/
    public function getContainingBlocksFrom(coordinates:ThreeDimensional, world:World):Vector<Block> {
        final allCoordinates = getContainingCoordinatesFrom(coordinates, 1);
        final blocks = new Vector(allCoordinates.length);
        var i = 0;
        for(anyCoordinates in allCoordinates){
            blocks.set(i, world.getBlockAt(anyCoordinates));
            i++;
        }
        return blocks;
    }
}