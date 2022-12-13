package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions.ReadOnlyArray;
import nl.imfi_jz.minecraft_api.GameObject.Item;

/** An inventory storing a fixed amount of items. Each item is stored at a specific slot. Slots are identified by a number. **/
interface Inventory extends Displayable {
    /** Returns an array containing the slot numbers of all slots that containt an item in this inventory. **/
    function getOccupiedSlots():ReadOnlyArray<Int>;
    @:deprecated('Since 0.2.x-alpha') function occupiedSlots():ReadOnlyArray<Int>;

    /** Gets the total amount of slots this inventory has. **/
    function getSlotCount():Int;
    /** Gets the current number of slots that have no item. **/
    function getEmptySlotCount():Int;

    /** Gets the quantity of the item present at `slot`. **/
    function getQuantity(slot:Int):Int;
    /** Sets the quantity of the item present at `slot` to `quantity`. Returns whether the quantity has successfully changed. **/
    function setQuantity(slot:Int, quantity:Int):Bool;

    /** Change the item at `slot` to `item`. Returns whether or not the item has changed successfully. **/
    function setItem(slot:Int, item:Item):Bool;
    /** Returns the item present at `slot`. Use `getQuantity` to see the amount of an item at a slot. **/
    function getItem(slot:Int):Item;
}

/** An interface to get the slot numbers of special "equipment" slots. This usually represents a smaller part of an in-game inventory. **/
interface Equipment extends Inventory {
    function getHelmetSlot():Int;
    function getChestplateSlot():Int;
    function getLeggingsSlot():Int;
    function getBootsSlot():Int;
    function getPrimaryHandSlot():Int;
    function getSecondaryHandSlot():Int;
}

/** An `Inventory` that has special slots that may transform certain items to a new item (e.g. crafting, cooking, enchanting). This usually represents a smaller part of an in-game inventory. **/
@:deprecated('Not yet implemented')
interface Workspace extends Inventory {
    //function inputSlots():Iterator<Int>;
    /** The inventory slot that reserved for output of some item transformation. **/
    function getOutputSlot():Int;
}

/** `GameObject`s usually have an inventory consisting of the parts available in this interface. **/
interface InventoryHolder {
    function getInventory():Inventory;
    function getEquipment():Equipment;
    function getWorkspace():Workspace;
}