package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.Scale.MaxMutableScale;

/** Represents anything that can be damaged. **/
interface Damageable {
    /** Damage this object by `amount`. Optionally add a `damager` being the cause of the damage. **/
    function damage(amount:Float, ?damager:GameObject):Bool;
    /** Heal/repair this object by `amount`. Optionally add a `healer` being the cause of the heal/repair. **/
    function heal(amount:Float, ?healer:GameObject):Bool;

    /** Get this object's current condition represented by a scale. **/
    function getCondition():Scale;
    
    //function setDamageMultiplier(multiplier:Float):Void; // Bad function / hard to implement
    /** Get this object's vulnerability in a scale from 0 to 1. 0 being invulnerable and 1 being normally vulnerable. **/
    function getVulnerability():Float;
    /** Set this object's vulnerability in a scale from 0 to 1. 0 being invulnerable and 1 being normally vulnerable. **/
    function setVulnerability(vulnerability:Float):Void;
}

/** Represents a damageable encounter. **/
interface EncounterDamageable extends Damageable {
    /** Get the current condition of this encounter represented by a scale. **/
    function getCondition():MaxMutableScale;
}

/** Represents anything breakable. **/
@:deprecated('Since 0.2.x-alpha')
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