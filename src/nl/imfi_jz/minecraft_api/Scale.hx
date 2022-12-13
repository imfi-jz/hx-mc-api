package nl.imfi_jz.minecraft_api;

/** A scaled numeric value, given a max and current value. Assuming the minimum value is 0, a percentage (0 to 1) can be calculated using `current() / max()`. **/
interface Scale {
    /** Gets the current amount. **/
    function getCurrent():Float;
    /** Gets the maximum value of this scale. **/
    function getMax():Float;

    /** Gets the current amount of `max` from 0 to 1. Multiply the returned value by `max` to get the original value. **/
    @:deprecated('Since 0.2.x-alpha') function multiplier():Float;
    /** The maximum value this scale represents. Multiply the returned value by `multiplier` to get the original value. **/
    @:deprecated('Since 0.2.x-alpha') function max():Float;
}

/** A scaled numeric value of which the max value can be changed. **/
interface MaxMutableScale extends Scale {
    /** Sets the maximum value of this scale. **/
    function setMax(value:Float):Void;
}