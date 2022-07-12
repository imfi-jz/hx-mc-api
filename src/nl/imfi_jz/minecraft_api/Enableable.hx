package nl.imfi_jz.minecraft_api;

interface Enableable {
    function setEnabled(enabled:Bool):Void;
    function isEnabled():Bool;
}