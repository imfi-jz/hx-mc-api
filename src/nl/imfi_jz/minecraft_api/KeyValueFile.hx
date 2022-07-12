package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.DataHolder.SerialDataHolder;
import nl.imfi_jz.minecraft_api.TypeDefinitions;

/** Represents a file that stores values at `String` keys. **/
interface KeyValueFile<T> extends SerialDataHolder<T> extends Named {
    /** Returns an array containing a `String` of the name of each folder in the path to the file. **/
    function getFilePath():Array<String>;
    /** Returns whether or not the file is automatically saved each time a value is set. **/
    function isAutosaving():Bool;
    /** Saves the file to disk. Returns whether or not the file was successfully saved. **/
    function save():Bool;
    /** Returns a collection of all the keys stored in this file. **/
    function getKeys():StandardCollection<String>;
}

/** Represents a file that stores values at multi-leveled `String` keys. Multi-leveled means there can be named sections containing multiple sub paths (I hope that makes sense). **/
interface NestableKeyValueFile<T> extends KeyValueFile<T> {
    /** Get a value at a multi-leveled `key`. **/
    function getValueByNestedKey(key:Array<String>):Any;
    /** Set a `value` at a multi-leveled `key`. **/
    function setValueByNestedKey(key:Array<String>, value:Any):Bool;
    /** Gets all keys including multi-leveled ones separated by level. **/
    function getNestedKeys():StandardCollection<StandardCollection<String>>;
}