package nl.imfi_jz.minecraft_api;

interface Identifiable {
    /** Gets a unique identifier as `String`. This will be persistent on server/game restarts. See https://docs.oracle.com/javase/8/docs/api/java/util/UUID.html#toString--. **/
    function getUniqueIdentifier():String;
}