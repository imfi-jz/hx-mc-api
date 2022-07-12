package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.GameObject.Item;
import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Encounter;
import nl.imfi_jz.minecraft_api.GameObjectFactory.SpawningItemFactory;
import nl.imfi_jz.minecraft_api.GameObjectFactory.SpawningEncounterFactory;
import nl.imfi_jz.minecraft_api.GameObject.Player;
import nl.imfi_jz.minecraft_api.GameObject.Block;

interface World extends Named extends Identifiable {
    function getBlockAt(coordinates:ThreeDimensional):Block;
    @:deprecated function getHighestBlockAt(x:Float, z:Float):Block;
    function getMaxBuildableY():Int;
    function getMinBuildableY():Int;
    
    //function getGameObjects():StandardCollection<GameObject>;

    /** Gets the online players on this world. **/
    function getPlayers():StandardCollection<Player>;
    /** Finds `GameObject`s near `coordinates` within this world, no further than `maxDistance` from `coordinates`. **/
    function getGameObjectsNearCoordinates(coordinates:ThreeDimensional, maxDistance:Float):StandardCollection<GameObject>;
    /** Gets all encounters in this world. **/
    function getEncounters():StandardCollection<Encounter>;
    /** Gets all items in this world. This does not include items within inventories. **/
    function getItems():StandardCollection<Item>;

    /** Gets the amount of in-game days this world has been active for. **/
    function getPassedDays():Float;
    /** Adds `days` to the amount of in-game days this world has been active for. `days` can be either negative or positive. This affects day/night time in-game. **/
    function addPassedDays(days:Float):Void;
    /** Returns whether or not the sun is currently up in this world. **/
    function isDayTime():Bool;

    /** Gets a factory that can spawn items in this world. **/
    function getItemFactory():SpawningItemFactory;
    /** Gets a factory that can spawn encounters in this world. **/
    function getEncounterFactory():SpawningEncounterFactory;

    /** Gets the capped sum of sunlight and block light at `coordinates` in this world, from 0 to 1. **/
    function getLuminosityAt(coordinates:ThreeDimensional):Float;
    /** Gets details on the environment at `coordinates` in this world. **/
    function getEnvironmentAt(coordinates:ThreeDimensional):LocalizedEnviornment;    
}
/*
    todo: Try to decrease API function count and make it less specific

    Ideas for related stuff to add:
    Load/isLoaded at coords
    Seed
    WorldBuilder (generator)?
*/