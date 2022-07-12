package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.DataHolder;
import nl.imfi_jz.minecraft_api.Breakable;
import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.Mountable.MountRider;
import nl.imfi_jz.minecraft_api.PotionEffect.PotionEffectable;
import nl.imfi_jz.minecraft_api.Inventory;
import nl.imfi_jz.minecraft_api.Named.Namable;

/** Anything that has a place in the game. `GameObject` itself is unspecific as to what it is but forms a base for more specific in-game objects. **/
interface GameObject extends Named extends Namable extends SerialDataHolder<String> extends InventoryHolder extends Breakable extends Movable extends Removable extends SoundEmitter extends Identifiable extends Placed extends Gravitable extends Comparable extends Categorized {

}

/** Anything a player may encounter, usually a mob. **/
interface Encounter extends GameObject extends PotionEffectable extends Mountable extends MountRider extends PropertyHolder<Any> {
    /** Returns the associated AI options for this encounter. **/
    function getAiConfiguration():AiControlable;
}

interface Player extends Encounter extends MessageReceiver {
    /** Gets the name of game mode this player is currently in. **/
    function getGameMode():String;
    /**
        Sets the game mode this player is currently in.
        
        `gameMode` is case insensitive.
        
        Returns whether or not the game mode was changed successfully.
        
        See https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/GameMode.html for available game modes.
    **/
    function setGameMode(gameMode:String):Bool;

    /** Gets the level of permissions this player has. **/
    @:deprecated('API may change.')
    function getPermissionLevel():Int;
    /** Gets the experience level this player currently has. The level is expressed by the number above the decimal and progress to the next level is expressed by the number below the decimal. **/
    function getExperienceLevel():Float;
}

/** A block placed somewhere in a world. Setting data values might have a special effect on blocks, see "Block States" at https://minecraft.gamepedia.com/Java_Edition_data_value. **/
interface Block extends GameObject extends PropertyHolder<Any> {
    /** Attempts to changes the block to type `typeName`. `typeName` is case insensitive and may match partially. Returns whether or not the type was changed successfully. **/
    function setType(typeName:String):Bool;
    /** Breaks this block with optional `tool`. Returns the items the block drops upon being broken. **/
    function breakByTool(?tool:Item):StandardCollection<Item>;

    /** The amount of light this block illuminates from 0 to 1 **/
    //function getIllumination():Float;
}

/** An item dropped in a world, stored in an inventory or present in a workspace. **/
interface Item extends GameObject extends Enchantable {
    //function getDurability():Int;
    //function setDurability(value:Int):Bool;
    /** Gets the additional caption that might be present on this item. Returns a collection of individiual lines of text and an empty collection in no caption is present. **/
    function getCaption():StandardCollection<String>;
    /** Sets an additional caption on this item. `lines` are individual lines of text that will be displayed in the item's details. Returns whether or not the caption was set successfully. **/
    function setCaption(lines:StandardCollection<String>):Bool;

    @:deprecated('May get removed in the future')
    function copyToCoordinates(coordinates:ThreeDimensional, world:World):Item;
}