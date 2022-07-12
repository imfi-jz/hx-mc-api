package nl.imfi_jz.minecraft_api;

/** An interface to access information about the environment at a certain location. **/
interface LocalizedEnviornment extends Categorized {
    function getCoordinates():ThreeDimensional;
    /** Gets the humidity from 0 to 1. **/
    function getHumidity():Float;
    /** Gets the temperature from 0 to 1. **/
    function getTemperature():Float;

    // Maybe these should be 0 to 1 as well
    /** Returns whether or not rain/snow is currently falling. **/
    function hasDownfall():Bool;
    /** Returns whether or not the weather is currently stormy. **/
    function hasThunder():Bool;
}