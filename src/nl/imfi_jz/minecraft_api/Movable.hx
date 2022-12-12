package nl.imfi_jz.minecraft_api;

interface Movable {
    /** The current velocity of this object. This would be called a vector in mathematical terms. **/
    function getVelocity():ThreeDimensional;
    /** Adds a `velocity` to this object's current velocity. **/
    function addVelocity(velocity:ThreeDimensional):Void;
}