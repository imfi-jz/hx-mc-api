package nl.imfi_jz.minecraft_api;

/** A `SoundEmitter` can play sounds. Usually a `SoundEmitter` has a location and sounds will be played at that location. **/
interface SoundEmitter {
    /**
        Attempts to play sound `soundName` at `volume` and with `pitch`.

        `soundName` is case insensitive and can match partially.
        See https://hub.spigotmc.org/javadocs/spigot/org/bukkit/Sound.html for available sounds.

        `volume` and `pitch` values are normally 1.

        Returns whether or not the sound was played.
    **/
    function playSoundByName(soundName:String, volume:Float = 1, pitch:Float = 1):Bool;
}