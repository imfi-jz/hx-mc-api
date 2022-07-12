package nl.imfi_jz.minecraft_api;

interface Named {
    /** Returns the name of this object. A name is usually not a reliable identifier. **/
    function getName():String;
}

/** Something that can be given a display name at any time. **/
interface Namable {
    function getDisplayName():String;
    function setDisplayName(name:String):Bool;
}