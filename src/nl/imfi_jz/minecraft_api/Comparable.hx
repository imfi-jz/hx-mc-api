package nl.imfi_jz.minecraft_api;

interface Comparable {
    // Could not be named "equals"
    /**
        Checks whether two objects of the same type refer to the same object, even when they are not the same object reference.

        For exmple, a player retreived from a call to `World.getPlayers` and a player retreived from `EventData.getPlayers` might refer to the same player, but would not be the same object reference. In this case a regular equality check (a == b) would return `false`, whilist this method (a.matches(b)) would return `true`.
    **/
    function matches<T:Comparable>(other:T):Bool;
}