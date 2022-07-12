package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Encounter;

/** Configuration for encounters controlled by AI (monsters, animals, etc.). **/
interface AiControlable {
    ///** 0 = none, 1 = nonaware, 2+ = default **/
    //function setAi(aiDepth:Int):Void;

    /** Gets whether or not this encounter will target anything. **/
    function getTargeting():Bool;
    /** Sets whether or not this encounter will target anything. **/
    function setTargeting(targeting:Bool):Bool;
    /** Gets whether or not this encounter will walk around. **/
    function getWandering():Bool;
    /** Sets whether or not this encounter will walk around. **/
    function setWandering(wander:Bool):Bool;
    /** Gets whether or not this encounter can pick up items. **/
    function getScavengeability():Bool;
    /** Sets whether or not this encounter can pick up items. **/
    function setScavengeability(scavenge:Bool):Bool;

    /** Gets the current target of this encounter. **/
    function getTarget():GameObject;
    /** Sets the current target of this encounter. Making `target` `null` will remove any current target. **/
    function setTarget(?target:Encounter):Bool;

    /** Gets all GameObjects this encounter currenlty has line of sight to. **/
    function getSightedGameObjects():StandardCollection<GameObject>;
    /** Gets whether or not this encounter can currently see `gameObject`. **/
    function canSee(gameObject:GameObject):Bool;
}