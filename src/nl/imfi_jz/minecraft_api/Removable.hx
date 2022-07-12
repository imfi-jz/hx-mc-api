package nl.imfi_jz.minecraft_api;

/** Objects that can be removed from the world. **/
interface Removable {
    /** Removes this object from the game. Returns whether or not removing was successful. **/
    function remove():Bool;
    @:deprecated function removeNaturally():Bool;
}