package nl.imfi_jz.minecraft_api;

/** Something that has a place in a world. **/
interface Placed {
    /** Gets the current X, Y, Z coordinates of this object. X and Z are in the center of the object and Y (height) at the bottom. **/
    function getCoordinates():ThreeDimensional;
    /** Gets the current world this object is in. **/
    function getWorld():World;
    /**
        Teleports this object to given `coordinates` in `world`. If `world` is left out (or null), the object's current world is used.
        
        Returns whether teleportation was successful or not.
    **/
    function teleport(coordinates:ThreeDimensional, ?world:World):Bool;
    /** Gets the size of this object as a box. X, Y and Z would in this context mean width, height and depth. **/
    function getSize():ThreeDimensional;
    /** A number from 0 to 1 indicating how easily this block can be passed (lower is more solid). **/
    function getPermeability():Float;

    //function existenceTimeInSeconds():Float;
}