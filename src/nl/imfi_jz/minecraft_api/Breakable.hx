package nl.imfi_jz.minecraft_api;

/** Represents anything breakable. **/
interface Breakable {
    /** Damage this object in a scale (`scaledDamge`) from 0 to 1. Optionally add a `damager` being the cause of the damage. **/
    function damage(scaledDamage:Float, ?damager:GameObject):Bool;
    /** Get this object's current condition represented in a scale. **/
    function getCondition():Scale;
    
    //function setDamageMultiplier(multiplier:Float):Void; // Bad function / hard to implement
    /** Get this object's vulnerability in a scale from 0 to 1. 0 being invulnerable and 1 being normally vulnerable. **/
    function getVulnerability():Float;
    /** Set this object's vulnerability in a scale from 0 to 1. 0 being invulnerable and 1 being normally vulnerable. **/
    function setVulnerability(vulnerability:Float):Void;
}