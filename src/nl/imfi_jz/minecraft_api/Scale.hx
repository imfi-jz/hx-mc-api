package nl.imfi_jz.minecraft_api;

/** A scaled representation of a numeric value, given a max and current value. **/
interface Scale {
    /** Gets the current amount of `max` from 0 to 1. Multiply the returned value by `max` to get the original value. **/
    function multiplier():Float;
    /** The maximum value this scale represents. Multiply the returned value by `multiplier` to get the original value. **/
    function max():Float;
}