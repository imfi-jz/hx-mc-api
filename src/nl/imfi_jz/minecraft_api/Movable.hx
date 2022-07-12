package nl.imfi_jz.minecraft_api;

interface Movable {
    function getVelocity():ThreeDimensional;
    /** Adds a `velocity` to this object's current velocity. **/
    function addVelocity(velocity:ThreeDimensional):Void;
}