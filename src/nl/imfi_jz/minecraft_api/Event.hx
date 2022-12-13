package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Encounter;
import nl.imfi_jz.minecraft_api.Inventory.Workspace;
import nl.imfi_jz.minecraft_api.GameObject.Player;
import nl.imfi_jz.minecraft_api.GameObject.Item;
import nl.imfi_jz.minecraft_api.GameObject.Block;

/** Identifies an in-game event and defines what should happen upon occurrence. **/
interface Event extends Named {
    /** What happens each time this event occurs. Events are triggered by the game and often contain `EventData` involved in this event. Note that not collections are empty when no data of this type is involved in this event. **/
    function occur(involvement:EventData):Void;
}
/** Represents an `Event` that can be cancelled. A cancelled event will block its vanilla actions and may block plugin defined actions depending on the plugin. The plugin should act upon the return value of `EventData.isCancelled`. **/
interface CancelingEvent extends Event {
    /** The return value of this function determines whether the event will cancel or not, where `true` cancels it and `false` does not. `involvement`s may be used to determine cancellation. **/
    function shouldCancel(involvement:EventData):Bool;
}

/** Data that may be available at in-game events. **/
interface EventData {
    /** Returns whether or not this event has been cancelled. You can use this to also cancel your plugin's event actions but can also choose not to. **/
    function isCancelled():Bool;

    /** Players involved in an in-game event. **/
    function getPlayers():ReadOnlyArray<Player>;
    /** Encounters involved in an in-game event. This will not include players as the `getPlayers` function provides those. **/
    function getEncounters():ReadOnlyArray<Encounter>;
    /** Items involved in an in-game event. This may include blocks that are in item-form, (dropped). **/
    function getItems():ReadOnlyArray<Item>;
    /** Placed blocks involved in an in-game event. This does not include blocks in item-form (dropped). **/
    function getBlocks():ReadOnlyArray<Block>;
    /** Workspaces involved in an in-game event. **/
    function getWorkspaces():ReadOnlyArray<Workspace>;
    /** Inventories involved in an in-game event. These may be chests, players or other types of inventories. **/
    function getInventories():ReadOnlyArray<Inventory>;
    //function getShapedRecipes():StandardCollection<ShapedRecipe>;
    //function getShapelessRecipes():StandardCollection<ShapelessRecipe>;

    /** Integer values involved in an in-game event. **/
    function getIntegers():ReadOnlyArray<Int>;
    /** Boolean values involved in an in-game event. **/
    function getBooleans():ReadOnlyArray<Bool>;
    /** Float values involved in an in-game event. **/
    function getFloats():ReadOnlyArray<Float>;
    /** String values involved in an in-game event. **/
    function getStrings():ReadOnlyArray<String>;
    /** Enum values, converted to `String`s, involved in an in-game event. **/
    function getEnumValues():ReadOnlyArray<String>;

    /** Unsafe access to execute any specific method this event may have, specified by `functionName`, with optional `arguments`. Only use this if the other functions of `EventData` do not suffice. See the Spigot documentation for the methods available for the event you are working with. Return values may be cast to the value type you expect from this method. **/
    function tryExecute<T>(functionName:String, ?arguments:StandardCollection<Any>):T;
    /** Unsafe access to execute any specific method or field this event may have via a Dynamic object. Only use this if the other functions of `EventData` do not suffice. See the Spigot documentation for the methods available for the event you are working with. **/
    function asDynamic():Dynamic;
}

interface Handler {
    /** Implementation on how to handle an event, given `data`. `HandlingData` should be implemented to contain data you need, handling this event. **/
    function handle(data:HandlingData):Bool;
}
interface HandlingData {}
/** Convenience interface to help structuring event handling especially when multiple handlers should handle one event. **/
interface EventHandler extends Handler {
    /** Get approperiate handling data from given `eventData`. Up to implementation what this `HandlingData` should be. **/
    function getHandlingData(eventData:EventData):HandlingData;
}