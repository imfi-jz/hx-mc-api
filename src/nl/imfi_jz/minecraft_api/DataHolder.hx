package nl.imfi_jz.minecraft_api;

/** A persistent data holder mapping values at `String` keys. Values set will be available even after a server restart. **/
interface SerialDataHolder<T> {
    /** Retrieve the value set at `key`. Returns `null` when no value was set or the value had been set to `null`. **/
    function getValue(key:String):T;
    /** 
        Set the value at `key`, replacing any potential value that was set to `key` before. Using `null` as value removes it.
        
        Returns `true` when the value was set successfully, `false` otherwise.
    **/
    function setValue(key:String, value:T):Bool;
}

/** Non-persistent metadata mapped via `String` keys. Values will be lost upon a server restart. **/
interface PropertyHolder<T> {
    /** Retrieve the value set at `key`. Returns `null` when no value was set or the value had been set to `null`. **/
    function getProperty(key:String):T;
    /** 
        Set the value at `key`, replacing any potential value that was set to `key` before. Using `null` as value removes it.
        
        Returns `true` when the value was set successfully, `false` otherwise.
    **/
    function setProperty(key:String, value:T):Bool;
}